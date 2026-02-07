import { Link } from 'react-router';
import { Calculator } from 'lucide-react';

type SidebarLogoProps = {
  onClick: () => void;
};

export function SidebarLogo({ onClick }: SidebarLogoProps) {
  return (
    <Link to="/" className="flex items-center gap-3 group" onClick={onClick}>
      <div className="relative">
        <div className="w-10 h-10 rounded-xl bg-linear-to-br from-teal-400 to-teal-600 flex items-center justify-center shadow-lg group-hover:scale-105 transition-transform">
          <Calculator className="w-5 h-5 text-white" />
        </div>
      </div>
      <div>
        <h1 className="font-heading font-bold text-lg tracking-tight">
          Master Math
        </h1>
        <p className="text-[10px] text-slate-400 uppercase tracking-wider">
          Year 7 Worksheets
        </p>
      </div>
    </Link>
  );
}
