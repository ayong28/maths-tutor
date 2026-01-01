import { Outlet  } from 'react-router';

export default function Root() {
  return (
    <div className="min-h-screen bg-linear-to-r bg-gray-500 flex flex-col items-center py-8 px-2 print:bg-white print:text-black">
      <Outlet />
    </div>
  );
}