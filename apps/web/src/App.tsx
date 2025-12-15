import { useState } from "react";
import { ChevronRight, Printer } from "lucide-react";
import { Fraction } from "./components/Fraction";
import { classNames, parseFraction, parseMixedNumber } from "./utils/utils";
import { MixedNumber } from "./components/MixedNumber";

// Example worksheet data, now includes improper fractions and mixed numbers
const WORKSHEETS = {
  Fractions: {
    Addition: [
      {
        title: "Fraction Addition Worksheet 1",
        questions: [
          "1/4 + 1/2 = ___",
          "2/3 + 3/5 = ___",
          "5/8 + 1/8 = ___",
          "1/3 + 1/6 = ___"
        ]
      },
      {
        title: "Fraction Addition Worksheet 2",
        questions: [
          "1/5 + 2/5 = ___",
          "7/10 + 2/10 = ___",
          "4/7 + 3/7 = ___",
          "1/9 + 4/9 = ___"
        ]
      },
      {
        title: "Improper Fractions & Mixed Numbers Addition",
        questions: [
          "7/4 + 5/4 = ___",
          "2 1/3 + 1 2/3 = ___",
          "3/2 + 1 1/2 = ___",
          "2 3/5 + 4/5 = ___",
          "5/3 + 8/3 = ___",
          "1 1/4 + 2 1/2 = ___"
        ]
      }
    ],
    Subtraction: [
      {
        title: "Fraction Subtraction Worksheet 1",
        questions: [
          "3/4 - 1/4 = ___",
          "5/6 - 1/3 = ___",
          "7/8 - 3/8 = ___",
          "4/5 - 2/5 = ___"
        ]
      },
      {
        title: "Improper Fractions & Mixed Numbers Subtraction",
        questions: [
          "9/4 - 5/4 = ___",
          "3 2/3 - 1 1/3 = ___",
          "7/3 - 4/3 = ___",
          "2 3/5 - 4/5 = ___",
          "2 1/4 - 3/4 = ___",
          "5 1/2 - 2 1/2 = ___"
        ]
      }
    ]
  },
  Algebra: {
    Addition: [
      {
        title: "Algebra Addition Worksheet 1",
        questions: [
          "x + 3x = ___",
          "2y + y = ___",
          "5a + 2a = ___",
          "b + b + b = ___"
        ]
      }
    ],
    Subtraction: [
      {
        title: "Algebra Subtraction Worksheet 1",
        questions: [
          "5x - 2x = ___",
          "7y - y = ___",
          "9a - 3a = ___",
          "4b - b = ___"
        ]
      }
    ]
  }
};
// ...existing code...
type Category = keyof typeof WORKSHEETS;
type SubCategory = keyof typeof WORKSHEETS[Category];

const categories = Object.keys(WORKSHEETS);

/**
 * Tokenize expression string to identify mixed numbers, fractions, operators, numbers, fill-ins, and variables.
 */
function tokenizeMathExpression(expr: string) {
  // - Mixed numbers (\d+\s+\d+/\d+)
  // - Fractions (\d+/\d+)
  // - Fill-in ("___")
  // - Numbers/variables/words (\w+)
  // - Operators (+ - =)
  // - Parentheses (\(|\))
  // - Any leftover single character
  const regex = /\d+\s+\d+\s*\/\s*\d+|\d+\s*\/\s*\d+|___|[+\-=()]|\w+|\s+|./g;
  return expr.match(regex) || [];
}

/**
 * Takes an expression string and replaces all occurrences of mixed numbers and a/b with their respective components.
 * Ensures fractions and mixed numbers are vertically aligned and of consistent height.
 */
function renderMathExpression(expr: string) {
  const tokens = tokenizeMathExpression(expr);
  // For alignment fix: wrap all major tokens in a flex-row container to baseline-align operands.
  // For each "operand", we can wrap in a span with inline-flex and align-middle for best results.
  return (
    <span className="inline-flex flex-row items-center flex-wrap [-webkit-font-smoothing:auto]">
      {tokens.map((token: string, idx: number) => {
        const cleanedToken = token.trim();
        if (!cleanedToken) {
          return <span key={`ws-${idx}`} className="mx-0.5" />;
        }
        const mixed = parseMixedNumber(cleanedToken);
        if (mixed)
          return (
            <MixedNumber
              key={idx}
              whole={mixed.whole}
              numerator={mixed.numerator}
              denominator={mixed.denominator}
            />
          );
        const frac = parseFraction(cleanedToken);
        if (frac)
          return (
            <Fraction key={idx} numerator={frac.numerator} denominator={frac.denominator} />
          );
        if (cleanedToken === "___")
          return (
            <span
              key={idx}
              className="inline-block border-b border-dashed border-blue-300 w-16 align-middle mx-2 min-h-[1.5em]"
            />
          );
        return (
          <span
            key={idx}
            className="mx-0.5 select-none font-math text-xl leading-tight min-w-[0.8em] text-center inline-block align-middle"
          >
            {cleanedToken}
          </span>
        );
      })}
    </span>
  );
}



const App = () => {
  const [selectedCategory, setSelectedCategory] = useState(null as string | null);
  const [selectedSubCategory, setSelectedSubCategory] = useState(null as string | null);
  const [selectedWorksheet, setSelectedWorksheet] = useState(null as {title: string; questions: string[]} | null);

  // For printing
  const handlePrint = () => {
    window.print();
  };

  // Reset subcategory + worksheet when category is changed
  const onSelectCategory = (cat: string) => {
    setSelectedCategory(cat);
    setSelectedSubCategory(null);
    setSelectedWorksheet(null);
  };

  // Reset worksheet when subcategory is changed
  const onSelectSubCategory = (subCat: string) => {
    setSelectedSubCategory(subCat);
    setSelectedWorksheet(null);
  };

  // Get subcategories for selected category
  // const subCategories = selectedCategory
  //   ? Object.keys(WORKSHEETS[selectedCategory as Category])
  //   : [];

  // Get worksheets for selected subcategory
  const worksheets =
    selectedCategory && selectedSubCategory
      ? WORKSHEETS[selectedCategory as Category][selectedSubCategory as SubCategory]
      : [];

  return (
    <div className="min-h-screen bg-linear-to-br from-teal-50 to-blue-100 flex flex-col items-center py-8 px-2 print:bg-white print:text-black">
      {/* Header */}
      <header className="mb-8 text-center">
        <h1 className="text-3xl font-bold text-blue-900 mb-2">
          Maths Tutoring Worksheets
        </h1>
        <p className="text-blue-700">Select a topic and category to view printable worksheets.</p>
      </header>

      {/* Main content area */}
      <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg flex flex-col md:flex-row overflow-hidden print:shadow-none print:bg-white">
        {/* Sidebar: Categories & Subcategories */}
        <aside className="md:w-1/3 border-r border-blue-100 bg-blue-50 px-6 py-6 print:hidden">
          <div>
            <h2 className="text-lg font-semibold text-blue-700 mb-4">
              Topics
            </h2>
            <ul>
              {categories.map((cat) => (
                <li key={cat} className="mb-2">
                  <button
                    className={classNames(
                      "flex items-center px-3 py-2 w-full rounded-lg mb-1 font-medium transition",
                      selectedCategory === cat
                        ? "bg-blue-200 text-blue-900"
                        : "hover:bg-blue-100 text-blue-700"
                    )}
                    onClick={() => onSelectCategory(cat)}
                  >
                    {cat}
                    <ChevronRight className="ml-auto w-4 h-4" />
                  </button>
                  {/* Subcategories */}
                  {selectedCategory === cat && (
                    <ul className="ml-4 mt-1">
                      {Object.keys(WORKSHEETS[cat as Category]).map((subCat) => (
                        <li key={subCat}>
                          <button
                            className={classNames(
                              "flex items-center px-2 py-1 w-full rounded-md text-sm transition",
                              selectedSubCategory === subCat
                                ? "bg-blue-300 text-blue-900 font-semibold"
                                : "hover:bg-blue-100 text-blue-700"
                            )}
                            onClick={() => onSelectSubCategory(subCat)}
                          >
                            {subCat}
                          </button>
                        </li>
                      ))}
                    </ul>
                  )}
                </li>
              ))}
            </ul>
          </div>
        </aside>
        {/* Main: Worksheets List or Selected Worksheet */}
        <main className="flex-1 p-8 print:px-0 print:py-0">
          {/* Show worksheet */}
          {selectedWorksheet ? (
            <div className="print:p-0">
              <div className="flex items-baseline justify-between mb-6 print:hidden">
                <h2 className="text-2xl font-bold text-blue-900">{selectedWorksheet.title}</h2>
                <button
                  onClick={handlePrint}
                  className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition"
                >
                  <Printer className="w-5 h-5" />
                  Print
                </button>
              </div>
              {/* For print, full titles and questions */}
              <div>
                <h2 className="text-2xl font-bold text-blue-900 block md:hidden mb-4 print:block">
                  {selectedWorksheet.title}
                </h2>
                <ol className="space-y-4 text-lg text-blue-900 print:text-black">
                  {selectedWorksheet.questions.map((q, idx) => (
                    <li key={idx} className="mb-3">
                      <span className='font-math text-blue-900 print:text-black'>
                        {selectedCategory === "Fractions"
                          ? renderMathExpression(q)
                          : q}
                      </span>
                      <div className="border-b border-dashed border-blue-300 mt-1 mb-2 print:border-black min-h-4" />
                    </li>
                  ))}
                </ol>
                <div className="mt-8 flex gap-4 print:hidden">
                  <button
                    className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded transition"
                    onClick={() => setSelectedWorksheet(null)}
                  >
                    Back to Worksheets
                  </button>
                  <button
                    onClick={handlePrint}
                    className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition"
                  >
                    <Printer className="w-5 h-5" />
                    Print
                  </button>
                </div>
              </div>
            </div>
          ) : (
            <>
              {/* List of worksheets */}
              {selectedCategory && selectedSubCategory ? (
                <div>
                  <h2 className="text-xl font-semibold text-blue-900 mb-4">
                    {selectedCategory} &rarr; {selectedSubCategory} Worksheets
                  </h2>
                  {worksheets.length ? (
                    <ul className="space-y-3">
                      {worksheets.map((ws, idx) => (
                        <li key={idx}>
                          <button
                            className="w-full flex items-center gap-3 px-5 py-4 bg-blue-50 hover:bg-blue-100 rounded-lg shadow transition text-left"
                            onClick={() => setSelectedWorksheet(ws)}
                          >
                            <ChevronRight className="w-5 h-5 text-blue-400" />
                            <span className="font-semibold text-blue-900">{ws.title}</span>
                          </button>
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <div className="text-blue-600">
                      No worksheets available for this subcategory.
                    </div>
                  )}
                </div>
              ) : (
                <div className="flex flex-col items-center justify-center min-h-50 text-blue-500">
                  <span className="text-6xl mb-2">🧮</span>
                  <p className="text-lg">Please select a topic and category to view worksheets.</p>
                </div>
              )}
            </>
          )}
        </main>
      </div>
      {/* Print-specific styling and optional math font */}
      <style>
        {`
          @media print {
            body {
              background: white !important;
            }
            .print\\:hidden { display: none !important; }
            .print\\:block { display: block !important; }
            .print\\:shadow-none { box-shadow: none !important; }
            .print\\:bg-white { background: #fff !important; }
            .print\\:text-black { color: #000 !important; }
          }
          .font-math {
            font-family: 'STIX Two Math', 'Cambria Math', 'Times New Roman', system-ui, sans-serif;
            font-variant-numeric: lining-nums;
            letter-spacing: 0.01em;
          }
        `}
      </style>
    </div>
  );
};

export default App;