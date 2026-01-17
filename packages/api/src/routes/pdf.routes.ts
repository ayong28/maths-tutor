import { Router, Request, Response } from 'express';
import { generateWorksheetPDF, PDFProblem } from '../services/pdf.service';

const router = Router();

interface GeneratePDFRequestBody {
  title: string;
  problems: PDFProblem[];
  options?: {
    includeAnswerKey?: boolean;
  };
}

/**
 * POST /api/generate-pdf
 * Generate a PDF worksheet from provided problems
 *
 * Request body:
 *   - title: string (worksheet title)
 *   - problems: { question: string, answer: string }[]
 *   - options?: { includeAnswerKey?: boolean }
 *
 * Response: PDF binary with Content-Type: application/pdf
 */
router.post('/generate-pdf', async (req: Request, res: Response) => {
  try {
    const body = req.body as GeneratePDFRequestBody;

    // Validate request body
    if (!body.title || typeof body.title !== 'string' || body.title.trim().length === 0) {
      res.status(400).json({ error: 'Title is required and must be a non-empty string' });
      return;
    }

    if (!Array.isArray(body.problems) || body.problems.length === 0) {
      res.status(400).json({ error: 'Problems array is required and must not be empty' });
      return;
    }

    if (body.problems.length > 100) {
      res.status(400).json({ error: 'Maximum 100 problems per worksheet' });
      return;
    }

    // Validate each problem
    for (let i = 0; i < body.problems.length; i++) {
      const problem = body.problems[i];
      if (!problem || typeof problem.question !== 'string' || typeof problem.answer !== 'string') {
        res.status(400).json({
          error: `Invalid problem at index ${i}: must have question and answer strings`
        });
        return;
      }
    }

    // Generate PDF
    const pdfBuffer = await generateWorksheetPDF({
      title: body.title.trim(),
      problems: body.problems,
      includeAnswerKey: body.options?.includeAnswerKey ?? true,
    });

    // Generate filename from title
    const filename = body.title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '') + '-worksheet.pdf';

    // Send PDF response
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `attachment; filename="${filename}"`);
    res.setHeader('Content-Length', pdfBuffer.length);
    res.send(pdfBuffer);
  } catch (error) {
    console.error('Error generating PDF:', error);
    res.status(500).json({
      error: 'Failed to generate PDF',
      message: error instanceof Error ? error.message : 'Unknown error'
    });
  }
});

export default router;
