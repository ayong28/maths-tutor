import { Outlet } from 'react-router';
import { useState, useRef } from 'react';
import { Menu } from 'lucide-react';
import { Sidebar } from '@/components/sidebar';
import CopyrightFooter from '@/components/CopyrightFooter';

export default function Root() {
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const menuButtonRef = useRef<HTMLButtonElement>(null);

  const handleCloseSidebar = () => {
    setSidebarOpen(false);
    menuButtonRef.current?.focus();
  };

  return (
    <div className="min-h-screen flex print:block print:bg-white">
      {/* Mobile menu button */}
      <button
        ref={menuButtonRef}
        onClick={() => setSidebarOpen(true)}
        aria-label="Open navigation menu"
        aria-haspopup="true"
        className="md:hidden fixed top-4 left-4 z-30 p-3 rounded-xl bg-slate-900 text-white shadow-lg hover:bg-slate-800 transition-colors print:hidden"
      >
        <Menu className="w-6 h-6" />
      </button>

      <Sidebar isOpen={sidebarOpen} onClose={handleCloseSidebar} />

      {/* Main Content Area - no margin on mobile, ml-64 on md+ */}
      <main className="flex-1 md:ml-64 print:ml-0">
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
