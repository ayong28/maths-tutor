import { useState } from 'react';

type PDFProblem = {
  question: string;
  answer: string;
}

interface UsePDFGeneratorReturn {
  generating: boolean;
  error: string | null;
  generatePDF: (title: string, problems: PDFProblem[], filename: string) => Promise<void>;
}

const API_BASE = import.meta.env.VITE_API_URL
  ? `${import.meta.env.VITE_API_URL}/api`
  : '/api';

/**
 * Hook for generating and downloading PDF worksheets via the backend API
 */
export const usePDFGenerator = (): UsePDFGeneratorReturn => {
  const [generating, setGenerating] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const generatePDF = async (
    title: string,
    problems: PDFProblem[],
    filename: string
  ): Promise<void> => {
    try {
      setGenerating(true);
      setError(null);

      // Call backend API to generate PDF
      const response = await fetch(`${API_BASE}/generate-pdf`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title,
          problems: problems.map(p => ({
            question: p.question,
            answer: p.answer,
          })),
        }),
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.error || `Failed to generate PDF: ${response.statusText}`);
      }

      // Get PDF blob from response
      const blob = await response.blob();

      // Create download link
      const url = URL.createObjectURL(blob);
      const link = window.document.createElement('a');
      link.href = url;
      link.download = filename;

      // Trigger download
      window.document.body.appendChild(link);
      link.click();

      // Cleanup
      window.document.body.removeChild(link);
      URL.revokeObjectURL(url);
    } catch (err) {
      const errorMessage = err instanceof Error ? err.message : 'Failed to generate PDF';
      setError(errorMessage);
      console.error('PDF generation error:', err);
    } finally {
      setGenerating(false);
    }
  };

  return { generating, error, generatePDF };
};
