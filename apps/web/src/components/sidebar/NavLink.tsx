import { Link } from 'react-router';
import { ChevronRight } from 'lucide-react';

type NavLinkProps = {
  to: string;
  label: string;
  icon: React.ReactNode;
  isActive: boolean;
  showChevron?: boolean;
  onClick: () => void;
};

export function NavLink({
  to,
  label,
  icon,
  isActive,
  showChevron = false,
  onClick,
}: NavLinkProps) {
  return (
    <Link
      to={to}
      onClick={onClick}
      className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${
        isActive
          ? 'bg-teal-500/20 text-teal-300'
          : 'text-slate-300 hover:bg-slate-800 hover:text-white'
      }`}
    >
      {icon}
      <span className="font-medium">{label}</span>
      {showChevron && <ChevronRight className="w-4 h-4 ml-auto" />}
    </Link>
  );
}
