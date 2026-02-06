import type { Difficulty } from "@/api/types";
import { DIFFICULTY_LEVELS } from "@/config/constants";

// Difficulty colors for the new design
const difficultyStyles: Record<Difficulty, { dot: string; label: string }> = {
  EASY: {
    dot: "bg-[#10b981]",
    label: "Easy",
  },
  MEDIUM: {
    dot: "bg-amber-500",
    label: "Medium",
  },
  HARD: {
    dot: "bg-[#ef4444]",
    label: "Hard",
  },
};

interface DifficultyFilterProps {
  selectedSubCategory: string | null;
  stagedDifficulties: Difficulty[];
  toggleDifficulty: (difficulty: Difficulty) => void;
}

const DifficultyFilter = ({
  selectedSubCategory,
  stagedDifficulties,
  toggleDifficulty,
}: DifficultyFilterProps) => {
  const isDisabled = !selectedSubCategory;

  return (
    <div
      className={`p-4 rounded-xl border transition-all ${
        isDisabled
          ? "bg-slate-50 border-slate-200 opacity-50 pointer-events-none"
          : "bg-slate-50 border-slate-200"
      }`}
    >
      <div className="space-y-2">
        {DIFFICULTY_LEVELS.map((difficulty) => {
          const style = difficultyStyles[difficulty];
          const isChecked = stagedDifficulties.includes(difficulty);

          return (
            <label
              key={difficulty}
              htmlFor={`difficulty-${difficulty}`}
              className={`flex items-center gap-3 cursor-pointer p-2 rounded-lg transition-all ${
                isChecked
                  ? "bg-white shadow-sm"
                  : "hover:bg-white"
              }`}
            >
              <input
                type="checkbox"
                id={`difficulty-${difficulty}`}
                checked={isChecked}
                onChange={() => toggleDifficulty(difficulty)}
                aria-label={`Filter by ${difficulty.toLowerCase()} difficulty`}
              />
              <div className={`w-2 h-2 rounded-full ${style.dot}`} />
              <span className="text-sm font-medium text-slate-700">
                {style.label}
              </span>
            </label>
          );
        })}
      </div>

      {stagedDifficulties.length === 0 && (
        <p className="text-xs text-slate-500 mt-3 italic">
          All difficulties shown
        </p>
      )}
    </div>
  );
};

export default DifficultyFilter;
