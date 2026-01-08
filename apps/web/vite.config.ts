  import { defineConfig } from 'vite';
  import react from '@vitejs/plugin-react';  // Changed from reactRouter
  import tailwindcss from '@tailwindcss/vite';
  import path from 'path';
  import { visualizer } from 'rollup-plugin-visualizer';

  export default defineConfig({
    plugins: [
      react({
        // Disable Fast Refresh for route files to suppress warning
        exclude: /routes\/.*.tsx$/,
      }),
      tailwindcss(),
      visualizer({
        open: true,
        gzipSize: true,
        filename: 'dist/stats.html'
      })
    ],
    resolve: {
      alias: {
        '@': path.resolve(__dirname, './src'),
      },
    },
    server: {
      proxy: {
        '/api': {
          target: 'http://localhost:3001',
          changeOrigin: true,
        },
      },
    },
  });