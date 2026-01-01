import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { RouterProvider, createBrowserRouter } from 'react-router';
import Root from './routes/root';
import Home from './routes/home';
import Category from './routes/category';
import Worksheet from './routes/worksheet';
import './index.css';

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
    <RouterProvider router={router} />
  </StrictMode>
);