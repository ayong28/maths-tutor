import { SidebarLogo } from './SidebarLogo';
import { SidebarCloseButton } from './SidebarCloseButton';
import { SidebarNav } from './SidebarNav';
import { SidebarFooter } from './SidebarFooter';

type SidebarProps = {
  isOpen: boolean;
  onClose: () => void;
};

export function Sidebar({ isOpen, onClose }: SidebarProps) {
  return (
    <>
      {/* Backdrop overlay - mobile only */}
      <div
        className={`
          fixed inset-0 bg-black/50 z-40 md:hidden
          transition-opacity duration-300
          ${isOpen ? 'opacity-100' : 'opacity-0 pointer-events-none'}
        `}
        onClick={onClose}
        aria-hidden="true"
      />

      {/* Sidebar */}
      <aside
        className={`
          fixed left-0 top-0 h-full w-64 bg-slate-900 text-white flex flex-col z-50
          transform transition-transform duration-300 ease-out
          md:translate-x-0
          ${isOpen ? 'translate-x-0' : '-translate-x-full'}
          print:hidden
        `}
      >
        {/* Header with Logo and Close Button */}
        <div className="p-6 border-b border-slate-700 flex items-center justify-between">
          <SidebarLogo onClick={onClose} />
          <SidebarCloseButton onClick={onClose} />
        </div>

        <SidebarNav onClose={onClose} />
        <SidebarFooter />
      </aside>
    </>
  );
}
