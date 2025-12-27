import { useState } from 'react';
import { pdf } from '@react-pdf/renderer';
import type { ReactElement } from 'react';

interface UsePDFGeneratorReturn {
  generating: boolean;
  error: string | null;
  generatePDF: (document: ReactElement<any>, filename: string) => Promise<void>;
}

/**
 * Hook for generating and downloading PDFs from @react-pdf/renderer Documents
 */
export const usePDFGenerator = (): UsePDFGeneratorReturn => {
  const [generating, setGenerating] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const generatePDF = async (
    document: ReactElement<any>,
    filename: string
  ): Promise<void> => {
    try {
      setGenerating(true);
      setError(null);

      // Generate PDF blob
      const blob = await pdf(document).toBlob();

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
