import { Outlet, Link, useLocation } from 'react-router';
import { Calculator, BookOpen, Home, ChevronRight } from 'lucide-react';
import CopyrightFooter from '@/components/CopyrightFooter';

export default function Root() {
  const location = useLocation();
  const isHome = location.pathname === '/';

  return (
    <div className="min-h-screen flex print:block print:bg-white">
      {/* Sidebar Navigation */}
      <aside className="fixed left-0 top-0 h-full w-64 bg-slate-900 text-white flex flex-col print:hidden z-50">
        {/* Logo Area */}
        <div className="p-6 border-b border-slate-700">
          <Link to="/" className="flex items-center gap-3 group">
            <div className="relative">
              <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-teal-400 to-teal-600 flex items-center justify-center shadow-lg group-hover:scale-105 transition-transform">
                <Calculator className="w-5 h-5 text-white" />
              </div>
              <div className="absolute -bottom-1 -right-1 w-4 h-4 rounded-full bg-amber-400 flex items-center justify-center">
                <span className="text-[8px] font-bold text-slate-900">7</span>
              </div>
            </div>
            <div>
              <h1 className="font-heading font-bold text-lg tracking-tight">MathPractice</h1>
              <p className="text-[10px] text-slate-400 uppercase tracking-wider">Year 7 Worksheets</p>
            </div>
          </Link>
        </div>

        {/* Navigation Links */}
        <nav className="flex-1 p-4 space-y-1 overflow-y-auto">
          <Link
            to="/"
            className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
              isHome
                ? 'bg-teal-500/20 text-teal-300'
                : 'text-slate-300 hover:bg-slate-800 hover:text-white'
            }`}
          >
            <Home className="w-5 h-5" />
            <span className="font-medium">All Topics</span>
            {isHome && <ChevronRight className="w-4 h-4 ml-auto" />}
          </Link>

          <div className="pt-4 pb-2">
            <p className="px-4 text-[10px] font-semibold text-slate-500 uppercase tracking-wider">
              Quick Access
            </p>
          </div>

          <Link
            to="/fractions"
            className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
              location.pathname.startsWith('/fractions')
                ? 'bg-teal-500/20 text-teal-300'
                : 'text-slate-300 hover:bg-slate-800 hover:text-white'
            }`}
          >
            <BookOpen className="w-5 h-5" />
            <span className="font-medium">Fractions</span>
          </Link>

          <Link
            to="/algebra"
            className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
              location.pathname.startsWith('/algebra')
                ? 'bg-teal-500/20 text-teal-300'
                : 'text-slate-300 hover:bg-slate-800 hover:text-white'
            }`}
          >
            <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">x</span>
            <span className="font-medium">Algebra</span>
          </Link>

          <Link
            to="/integers"
            className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
              location.pathname.startsWith('/integers')
                ? 'bg-teal-500/20 text-teal-300'
                : 'text-slate-300 hover:bg-slate-800 hover:text-white'
            }`}
          >
            <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">±</span>
            <span className="font-medium">Integers</span>
          </Link>

          <Link
            to="/decimals"
            className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
              location.pathname.startsWith('/decimals')
                ? 'bg-teal-500/20 text-teal-300'
                : 'text-slate-300 hover:bg-slate-800 hover:text-white'
            }`}
          >
            <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">.</span>
            <span className="font-medium">Decimals</span>
          </Link>
        </nav>

        {/* Footer */}
        <div className="p-4 border-t border-slate-700">
          <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-gradient-to-r from-teal-600/20 to-amber-500/10">
            <div className="w-8 h-8 rounded-lg bg-amber-400 flex items-center justify-center">
              <span className="text-sm font-bold text-slate-900">!</span>
            </div>
            <div className="flex-1">
              <p className="text-xs font-medium text-slate-200">4,628 Problems</p>
              <p className="text-[10px] text-slate-400">Ready to practice</p>
            </div>
          </div>
        </div>
      </aside>

      {/* Main Content Area */}
      <main className="flex-1 ml-64 print:ml-0">
        <div className="min-h-screen flex flex-col">
          <div className="flex-1">
            <Outlet />
          </div>

          <CopyrightFooter />
        </div>
      </main>
    </div>
  );
}
