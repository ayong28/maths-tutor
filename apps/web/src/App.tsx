import { ChevronRight, Printer } from 'lucide-react'

function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-teal-50 to-blue-100 flex flex-col items-center py-8 px-2">
      {/* Header */}
      <header className="mb-8 text-center">
        <h1 className="text-3xl font-bold text-blue-900 mb-2">
          Maths Tutoring Worksheets
        </h1>
        <p className="text-blue-700">
          Select a topic and category to view printable worksheets.
        </p>
      </header>

      {/* Main content area */}
      <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg flex flex-col md:flex-row overflow-hidden">
        {/* Sidebar */}
        <aside className="md:w-1/3 border-r border-blue-100 bg-blue-50 px-6 py-6">
          <h2 className="text-lg font-semibold text-blue-700 mb-4">Topics</h2>
          <ul>
            <li className="mb-2">
              <button className="flex items-center px-3 py-2 w-full rounded-lg mb-1 font-medium transition bg-blue-200 text-blue-900">
                Fractions
                <ChevronRight className="ml-auto w-4 h-4" />
              </button>
              <ul className="ml-4 mt-1">
                <li>
                  <button className="flex items-center px-2 py-1 w-full rounded-md text-sm transition bg-blue-300 text-blue-900 font-semibold">
                    Addition
                  </button>
                </li>
                <li>
                  <button className="flex items-center px-2 py-1 w-full rounded-md text-sm transition hover:bg-blue-100 text-blue-700">
                    Subtraction
                  </button>
                </li>
                <li>
                  <button className="flex items-center px-2 py-1 w-full rounded-md text-sm transition hover:bg-blue-100 text-blue-700">
                    Reduction
                  </button>
                </li>
              </ul>
            </li>
            <li className="mb-2">
              <button className="flex items-center px-3 py-2 w-full rounded-lg mb-1 font-medium transition hover:bg-blue-100 text-blue-700">
                Algebra
                <ChevronRight className="ml-auto w-4 h-4" />
              </button>
            </li>
          </ul>
        </aside>

        {/* Main content */}
        <main className="flex-1 p-8">
          <div className="flex items-baseline justify-between mb-6">
            <h2 className="text-2xl font-bold text-blue-900">
              Fractions → Addition Worksheets
            </h2>
            <button className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
              <Printer className="w-5 h-5" />
              Print
            </button>
          </div>

          {/* Sample fraction display */}
          <div className="space-y-4 text-lg text-blue-900">
            <p className="text-sm text-blue-600 mb-4">
              Tailwind + Lucide icons working!
            </p>

            {/* Sample math expression */}
            <div className="flex items-center gap-2 font-math text-xl">
              <span>1.</span>
              <span className="inline-flex flex-col items-center mx-1">
                <span className="border-b border-blue-600 px-1">1</span>
                <span>4</span>
              </span>
              <span>+</span>
              <span className="inline-flex flex-col items-center mx-1">
                <span className="border-b border-blue-600 px-1">1</span>
                <span>2</span>
              </span>
              <span>=</span>
              <span className="border-b border-dashed border-blue-300 w-16" />
            </div>

            <div className="flex items-center gap-2 font-math text-xl">
              <span>2.</span>
              <span className="inline-flex flex-col items-center mx-1">
                <span className="border-b border-blue-600 px-1">2</span>
                <span>3</span>
              </span>
              <span>+</span>
              <span className="inline-flex flex-col items-center mx-1">
                <span className="border-b border-blue-600 px-1">3</span>
                <span>5</span>
              </span>
              <span>=</span>
              <span className="border-b border-dashed border-blue-300 w-16" />
            </div>
          </div>
        </main>
      </div>
    </div>
  )
}

export default App
