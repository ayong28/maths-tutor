/**
 * Mock PDFKit for testing
 * This mock provides a minimal implementation of PDFKit methods used in the PDF generator
 */

export class MockPDFDocument {
  private textCalls: Array<{ text: string; x?: number; y?: number; options?: any }> = [];
  private currentFontSize: number = 12;

  fontSize(size: number) {
    this.currentFontSize = size;
    return this;
  }

  text(text: string, x?: number, y?: number, options?: any) {
    this.textCalls.push({ text, x, y, options });
    return this;
  }

  /**
   * Mock implementation of widthOfString
   * Returns a simple width calculation based on string length
   */
  widthOfString(str: string): number {
    if (!str) return 0;
    // Simple approximation: average character width at current font size
    return str.length * (this.currentFontSize * 0.6);
  }

  moveTo(x: number, y: number) {
    return this;
  }

  lineTo(x: number, y: number) {
    return this;
  }

  stroke() {
    return this;
  }

  pipe(stream: any) {
    return this;
  }

  end() {
    return this;
  }

  addPage() {
    return this;
  }

  moveDown(lines?: number) {
    return this;
  }

  /**
   * Test helper: get all text calls
   */
  getTextCalls() {
    return this.textCalls;
  }

  /**
   * Test helper: get text at specific index
   */
  getTextAt(index: number): string {
    return this.textCalls[index]?.text || '';
  }

  /**
   * Test helper: find text containing a specific string
   */
  findText(search: string): string | undefined {
    return this.textCalls.find(call => call.text.includes(search))?.text;
  }

  /**
   * Test helper: reset all calls
   */
  reset() {
    this.textCalls = [];
    this.currentFontSize = 12;
  }
}

export default MockPDFDocument;
