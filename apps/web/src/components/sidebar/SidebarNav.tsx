import { useLocation } from 'react-router';
import { BookOpen, Home } from 'lucide-react';
import { NavLink } from './NavLink';

type SidebarNavProps = {
  onClose: () => void;
};

const quickAccessLinks = [
  {
    to: '/fractions',
    label: 'Fractions',
    icon: <BookOpen className="w-5 h-5" />,
  },
  {
    to: '/algebra',
    label: 'Algebra',
    icon: (
      <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">
        x
      </span>
    ),
  },
  {
    to: '/integers',
    label: 'Integers',
    icon: (
      <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">
        ±
      </span>
    ),
  },
  {
    to: '/decimals',
    label: 'Decimals',
    icon: (
      <span className="w-5 h-5 flex items-center justify-center text-lg font-heading font-bold">
        .
      </span>
    ),
  },
];

export function SidebarNav({ onClose }: SidebarNavProps) {
  const location = useLocation();
  const isHome = location.pathname === '/';

  return (
    <nav className="flex-1 p-4 space-y-1 overflow-y-auto">
      <NavLink
        to="/"
        label="All Topics"
        icon={<Home className="w-5 h-5" />}
        isActive={isHome}
        showChevron={isHome}
        onClick={onClose}
      />

      <div className="pt-4 pb-2">
        <p className="px-4 text-[10px] font-semibold text-slate-500 uppercase tracking-wider">
          Quick Access
        </p>
      </div>

      {quickAccessLinks.map((link) => (
        <NavLink
          key={link.to}
          to={link.to}
          label={link.label}
          icon={link.icon}
          isActive={location.pathname.startsWith(link.to)}
          onClick={onClose}
        />
      ))}
    </nav>
  );
}
