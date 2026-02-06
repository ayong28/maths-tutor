import { StrictMode, lazy } from 'react';
import { createRoot } from 'react-dom/client';
import { RouterProvider, createBrowserRouter } from 'react-router';
import { QueryClientProvider } from '@tanstack/react-query';
import { queryClient } from './lib/queryClient';
import Root from './routes/root';
import './index.css';

// Lazy load route components
const Home = lazy(() => import('./routes/home'));
const Category = lazy(() => import('./routes/category'));
const Worksheet = lazy(() => import('./routes/worksheet'));

// Define routes as RouteObject[]
const router = createBrowserRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        index: true,
        element: <Home />,
        loader: () => import('./routes/home').then(m => m.clientLoader()),
      },
      {
        path: ':category',
        element: <Category />,
        loader: ({ params }) =>
          import('./routes/category').then(m =>
            m.clientLoader({ params: params as { category: string } })
          ),
      },
      {
        path: ':category/:subcategory',
        element: <Worksheet />,
        loader: ({ params, request }) =>
          import('./routes/worksheet').then(m =>
            m.clientLoader({
              params: params as { category: string; subcategory: string },
              request
            })
          ),
      },
    ],
  },
]);

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
      <RouterProvider router={router} />
    </QueryClientProvider>
  </StrictMode>
);