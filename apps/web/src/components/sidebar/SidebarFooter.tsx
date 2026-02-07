export function SidebarFooter() {
  return (
    <div className="p-4 border-t border-slate-700">
      <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-linear-to-r from-teal-600/20 to-amber-500/10">
        <div className="w-8 h-8 rounded-lg bg-amber-400 flex items-center justify-center">
          <span className="text-sm font-bold text-slate-900">!</span>
        </div>
        <div className="flex-1">
          <p className="text-xs font-medium text-slate-200">4,628 Problems</p>
          <p className="text-[10px] text-slate-400">Ready to practice</p>
        </div>
      </div>
    </div>
  );
}
