  import { type ProblemFilters, type CategoryInfo, type Problem } from './types';

  const API_BASE = import.meta.env.VITE_API_URL || '/api';

  async function handleResponse<T>(response: Response): Promise<T> {
    if (!response.ok) {
      throw new Error(`API request failed: ${response.statusText}`);
    }
    return response.json();
  }

  export async function getCategories(): Promise<CategoryInfo[]> {
    const response = await fetch(`${API_BASE}/categories`);
    return handleResponse<CategoryInfo[]>(response);
  }

  export async function getProblems(filters: ProblemFilters): Promise<Problem[]> {
    const params = new URLSearchParams();

    if (filters.type) params.set('type', filters.type);
    if (filters.difficulty) params.set('difficulty', filters.difficulty.join(','));
    if (filters.tags) params.set('tags', filters.tags.join(','));
    if (filters.limit) params.set('limit', filters.limit.toString());
    if (filters.seed) params.set('seed', filters.seed);

    const response = await fetch(`${API_BASE}/problems?${params}`);
    return handleResponse<Problem[]>(response);
  }

  export async function getTags(type: string): Promise<string[]> {
    const response = await fetch(`${API_BASE}/tags/${type}`);
    return handleResponse<string[]>(response);
  }
