import { FlaskConical } from "lucide-react";

export default function BetaBadge() {
  return (
    <div className="fixed bottom-6 right-6 z-50 animate-fade-in-up delay-500">
      <div className="group relative flex items-center gap-2.5 pl-3 pr-4 py-2 rounded-full bg-slate-900/90 backdrop-blur-sm border border-slate-700/50 shadow-lg cursor-default transition-all duration-300 hover:bg-slate-800">
        {/* Pulse dot */}
        <span className="relative flex h-2.5 w-2.5">
          <span className="absolute inline-flex h-full w-full rounded-full bg-amber-400 opacity-75 animate-ping" />
          <span className="relative inline-flex h-2.5 w-2.5 rounded-full bg-amber-400" />
        </span>

        <FlaskConical className="w-3.5 h-3.5 text-teal-400" />

        <span className="text-xs font-heading font-semibold tracking-wide text-slate-200">
          Beta
        </span>

        {/* Tooltip on hover */}
        <div className="absolute bottom-full right-0 mb-2.5 px-3 py-2 rounded-lg bg-slate-900 border border-slate-700/50 shadow-xl opacity-0 pointer-events-none group-hover:opacity-100 transition-opacity duration-200 whitespace-nowrap">
          <p className="text-xs text-slate-300">
            This website is still in Beta testing — you may encounter bugs
          </p>
          <div className="absolute bottom-0 right-6 translate-y-1/2 rotate-45 w-2 h-2 bg-slate-900 border-r border-b border-slate-700/50" />
        </div>
      </div>
    </div>
  );
}
