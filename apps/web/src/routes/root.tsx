import { Outlet, Link } from 'react-router';

export default function Root() {
  return (
    <div className="min-h-screen bg-linear-to-r from-blue-600 to-blue-400 flex flex-col items-center py-8 px-2 print:bg-white print:text-black">
      {/* Header */}
      <header className="mb-8 text-center print:hidden">
        <Link to="/" className="hover:opacity-80 transition">
          <h1 className="text-3xl font-bold text-blue-950 mb-2">
            Maths Tutoring Worksheets
          </h1>
          <p className="text-blue-900">
            Select a topic and category to view printable worksheets.
          </p>
        </Link>
      </header>

      {/* Route content renders here */}
      <Outlet />
    </div>
  );
}