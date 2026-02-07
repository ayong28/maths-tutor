import { X } from 'lucide-react';

type SidebarCloseButtonProps = {
  onClick: () => void;
};

export function SidebarCloseButton({ onClick }: SidebarCloseButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="md:hidden p-2 rounded-lg text-slate-400 hover:text-white hover:bg-slate-800 transition-colors"
      aria-label="Close navigation menu"
    >
      <X className="w-5 h-5" />
    </button>
  );
}
