import type { Difficulty } from "@/api/types";
import { DIFFICULTY_LEVELS } from "@/config/constants";
import { classNames } from "@/utils/utils";

const DifficultyFilter = ({ selectedSubCategory, stagedDifficulties, toggleDifficulty }: { selectedSubCategory: string | null; stagedDifficulties: Difficulty[]; toggleDifficulty: (difficulty: Difficulty) => void }) => {
  return (
              <div
                className={classNames(
                  "mb-4 p-4 bg-white rounded-lg border border-blue-200",
                  selectedSubCategory
                    ? "bg-white border-blue-200"
                    : "bg-gray-100 border-gray-200 opacity-50 pointer-events-none"
                )}
              >
                <h3 className="text-sm font-semibold text-blue-800 mb-3">
                  Difficulty Levels
                </h3>
                <div className="space-y-2">
                  {DIFFICULTY_LEVELS.map((difficulty) => (
                    <label
                      key={difficulty}
                      htmlFor={`difficulty-${difficulty}`}
                      className="flex items-center gap-2 cursor-pointer hover:bg-blue-50 p-1 rounded transition"
                    >
                      <input
                        type="checkbox"
                        id={`difficulty-${difficulty}`}
                        checked={stagedDifficulties.includes(difficulty)}
                        onChange={() => toggleDifficulty(difficulty)}
                        className="w-4 h-4 text-blue-700 rounded focus:ring-2 focus:ring-blue-500"
                        aria-label={`Filter by ${difficulty.toLowerCase()} difficulty`}
                      />
                      <span className="text-sm text-blue-900">
                        {difficulty.charAt(0) +
                          difficulty.slice(1).toLowerCase()}
                      </span>
                    </label>
                  ))}
                </div>
                {stagedDifficulties.length === 0 && (
                  <p className="text-xs text-blue-700 mt-2 italic">
                    All difficulties shown
                  </p>
                )}
              </div>
  )
}

export default DifficultyFilter
