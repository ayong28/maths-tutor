import {
  type CategoryInfo,
  type Problem,
  type ProblemFilters,
  type ProblemType,
} from "./types";

/**
 * API Client Configuration
 */
const API_BASE_URL = import.meta.env.VITE_API_URL || "http://localhost:3001";

/**
 * Custom error class for API errors
 */
export class ApiError extends Error {
  public status?: number;
  public response?: unknown;
  constructor(message: string) {
    super(message);
    this.name = "ApiError";
  }
}

/**
 * Generic fetch wrapper with error handling
 */
async function apiFetch<T>(
  endpoint: string,
  options?: RequestInit
): Promise<T> {
  const url = `${API_BASE_URL}${endpoint}`;

  try {
    const response = await fetch(url, {
      headers: {
        "Content-Type": "application/json",
        ...options?.headers,
      },
      ...options,
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      const error = new ApiError(
        errorData.error || `HTTP ${response.status}: ${response.statusText}`
      );
      error.status = response.status;
      error.response = errorData;
      throw error;
    }

    return await response.json();
  } catch (error) {
    if (error instanceof ApiError) {
      throw error;
    }

    // Network or parsing error
    const apiError = new ApiError(
      error instanceof Error ? error.message : "Unknown error occurred"
    );
    apiError.response = error;
    throw apiError;
  }
}

/**
 * Build query string from object
 */
function buildQueryString(params: Record<string, unknown>): string {
  const searchParams = new URLSearchParams();

  Object.entries(params).forEach(([key, value]) => {
    if (value !== undefined && value !== null) {
      if (Array.isArray(value)) {
        // Join arrays with comma (e.g., difficulty=EASY,MEDIUM)
        searchParams.set(key, value.join(","));
      } else {
        searchParams.set(key, String(value));
      }
    }
  });

  const queryString = searchParams.toString();
  return queryString ? `?${queryString}` : "";
}

/**
 * API Client Methods
 */

/**
 * Get all problem categories with counts
 */
export async function getCategories(): Promise<CategoryInfo[]> {
  return apiFetch<CategoryInfo[]>("/api/categories");
}

/**
 * Get problems with optional filters
 */
export async function getProblems(
  filters: ProblemFilters = {}
): Promise<Problem[]> {
  const queryString = buildQueryString({
    type: filters.type,
    difficulty: filters.difficulty,
    tags: filters.tags,
    limit: filters.limit,
    seed: filters.seed,
  });

  return apiFetch<Problem[]>(`/api/problems${queryString}`);
}

/**
 * Get available tags for a problem type
 */
export async function getTags(type: ProblemType): Promise<string[]> {
  return apiFetch<string[]>(`/api/tags/${type}`);
}

/**
 * Health check endpoint
 */
export async function healthCheck(): Promise<{
  status: string;
  timestamp: string;
}> {
  return apiFetch("/health");
}
