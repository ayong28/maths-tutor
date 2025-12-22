module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  roots: ['<rootDir>'],
  testMatch: ['**/__tests__/**/*.ts', '**/*.test.ts'],
  testPathIgnorePatterns: [
    '/node_modules/',
    '/apps/',
    '/packages/',
  ],
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  collectCoverageFrom: [
    'generate-worksheet-pdf.ts',
    '!**/*.d.ts',
    '!**/node_modules/**',
  ],
};
