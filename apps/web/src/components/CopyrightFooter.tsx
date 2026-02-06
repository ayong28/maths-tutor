export default function CopyrightFooter() {
  return (
    <footer className="py-6 px-8 print:hidden">
      <div className="max-w-6xl mx-auto flex items-center justify-center gap-2 text-sm text-slate-400">
        <span>©</span>
        <span>{new Date().getFullYear()}</span>
        <span className="text-slate-300 font-medium">
          Adrian Yong
        </span>
        <span className="mx-2 text-slate-300">·</span>
        <span>All rights reserved</span>
      </div>
    </footer>
  );
}
