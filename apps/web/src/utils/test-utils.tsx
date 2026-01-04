import { render, type RenderOptions, type RenderResult } from '@testing-library/react';
import { type ReactElement } from 'react';

/**
 * Custom render function for testing
 * Extend this as needed for providers (Router, Context, etc.)
 */
export function renderWithProviders(
  ui: ReactElement,
  options?: Omit<RenderOptions, 'wrapper'>
): RenderResult {
  return render(ui, options);
}

// Re-export everything from testing library
// eslint-disable-next-line react-refresh/only-export-components
export * from '@testing-library/react';