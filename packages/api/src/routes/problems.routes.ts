import { Router, Request, Response } from 'express';
import { ProblemType, Difficulty } from '../../../../generated/prisma';
import {
  getCategories,
  getProblems,
  getTagsForType,
  ProblemFilters,
} from '../services/problems.service';

const router = Router();

/**
 * GET /api/categories
 * List all problem types with counts
 */
router.get('/categories', async (_req: Request, res: Response) => {
  try {
    const categories = await getCategories();
    res.json(categories);
  } catch (error) {
    console.error('Error fetching categories:', error);
    res.status(500).json({ error: 'Failed to fetch categories' });
  }
});

/**
 * GET /api/problems
 * Query problems with filters
 * Query params:
 *   - type: ProblemType (e.g., FRACTION_ADDITION)
 *   - difficulty: Difficulty[] (e.g., EASY,MEDIUM)
 *   - tags: string[] (e.g., unlike-denominators)
 *   - limit: number (default 30)
 *   - seed: string (for reproducible results)
 */
router.get('/problems', async (req: Request, res: Response) => {
  try {
    const filters: ProblemFilters = {};

    // Parse type
    if (req.query.type) {
      filters.type = req.query.type as ProblemType;
    }

    // Parse difficulty (comma-separated)
    if (req.query.difficulty) {
      const difficultyStr = req.query.difficulty as string;
      filters.difficulty = difficultyStr
        .split(',')
        .map((d) => d.trim() as Difficulty);
    }

    // Parse tags (comma-separated)
    if (req.query.tags) {
      const tagsStr = req.query.tags as string;
      filters.tags = tagsStr.split(',').map((t) => t.trim());
    }

    // Parse limit
    if (req.query.limit) {
      filters.limit = parseInt(req.query.limit as string, 10);
    }

    // Parse seed
    if (req.query.seed) {
      filters.seed = req.query.seed as string;
    }

    const problems = await getProblems(filters);
    res.json(problems);
  } catch (error) {
    console.error('Error fetching problems:', error);
    res.status(500).json({ error: 'Failed to fetch problems' });
  }
});

/**
 * GET /api/tags/:type
 * Get available tags for a problem type
 */
router.get('/tags/:type', async (req: Request, res: Response) => {
  try {
    const type = req.params.type as ProblemType;
    const tags = await getTagsForType(type);
    res.json(tags);
  } catch (error) {
    console.error('Error fetching tags:', error);
    res.status(500).json({ error: 'Failed to fetch tags' });
  }
});

export default router;
