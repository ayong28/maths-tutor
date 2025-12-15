import { classNames } from "@/utils/utils";
import { ChevronRight } from "lucide-react";

type Worksheet = { title: string; questions: string[] };

const MainCategory = ({
  selectedCategory,
  category,
  setSelectedCategory,
  setSelectedSubCategory,
  setSelectedWorksheet,
}: {
  selectedCategory: string | null;
  category: string;
  setSelectedCategory: (cat: string) => void;
  setSelectedSubCategory: (subCat: string | null) => void;
  setSelectedWorksheet: (worksheet: Worksheet | null) => void;
}) => {
  // Reset subcategory + worksheet when category is changed
  const onSelectCategory = (cat: string) => {
    setSelectedCategory(cat);
    setSelectedSubCategory(null);
    setSelectedWorksheet(null);
  };

  return (
    <button
      className={classNames(
        "flex items-center px-3 py-2 w-full rounded-lg mb-1 font-medium transition",
        selectedCategory === category
          ? "bg-blue-200 text-blue-900"
          : "hover:bg-blue-100 text-blue-700"
      )}
      onClick={() => onSelectCategory(category)}
    >
      {category}
      <ChevronRight className="ml-auto w-4 h-4" />
    </button>
  );
};

export default MainCategory;
