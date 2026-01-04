# Cleanup Unused Code After React Router 7 Migration

**After migrating to React Router 7, some hooks are no longer used.**

## Discovery

You asked: "Are we still using `useCategories`?"

**Answer: No!** ❌

After the React Router 7 migration, these hooks are **no longer used:**
- ❌ `useCategories`
- ❌ `useProblems`
- ❌ `useTags`

**Still in use:**
- ✅ `usePDFGenerator` (used in `worksheet.tsx`)

## Why They're Unused

### Before (Old App.tsx pattern):

```typescript
// App.tsx - Client-side hooks with useEffect
import { useCategories, useProblems, useTags } from '@/hooks';

function App() {
  const { categories, loading, error } = useCategories();
  const { problems } = useProblems(filters);
  const { tags } = useTags(type);

  // Render with state...
}
```

### After (React Router 7 pattern):

```typescript
// routes/home.tsx - Server-side loader with direct API calls
import { getCategories } from '@/api/client';

export async function clientLoader() {
  const categories = await getCategories();  // Direct API call
  return { categories };
}

export default function Home() {
  const { categories } = useLoaderData();  // React Router hook
  // Render...
}
```

**Key difference:**
- **Old:** Custom hooks manage state/loading/errors
- **New:** React Router loaders fetch data, routes use `useLoaderData()`

## Your Options

### Option 1: Delete Unused Hooks (Recommended)

Clean up dead code and remove failing tests.

**What to delete:**

```bash
# Delete unused hooks
rm apps/web/src/hooks/useCategories.ts
rm apps/web/src/hooks/useProblems.ts
rm apps/web/src/hooks/useTags.ts

# Delete their tests
rm apps/web/src/hooks/__tests__/useCategories.test.ts
rm apps/web/src/hooks/__tests__/useProblems.test.ts
rm apps/web/src/hooks/__tests__/useTags.test.ts

# Delete old App backup (no longer needed)
rm apps/web/src/App.tsx.backup
rm apps/web/src/__tests__/App.test.tsx
```

**Update hooks index:**

Edit `apps/web/src/hooks/index.ts`:

```typescript
// BEFORE
export { useCategories } from './useCategories';
export { useProblems } from './useProblems';
export { useTags } from './useTags';
export { usePDFGenerator } from './usePDFGenerator';

// AFTER
export { usePDFGenerator } from './usePDFGenerator';
```

**Verify:**

```bash
npm test
```

**Expected:** Only `usePDFGenerator` tests remain (if they exist).

---

### Option 2: Keep Hooks for Future Use

Fix the tests but keep the hooks for potential future use.

**When to choose this:**
- Planning to migrate back to client-side data fetching
- Want to keep hooks as examples
- Might reuse in non-route components

**Follow the fix guide:**

See [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md) for step-by-step instructions.

---

### Option 3: Hybrid - Keep Code, Delete Tests

Keep the hook files but remove the failing tests.

```bash
# Delete only the tests
rm apps/web/src/hooks/__tests__/useCategories.test.ts
rm apps/web/src/hooks/__tests__/useProblems.test.ts
rm apps/web/src/hooks/__tests__/useTags.test.ts
rm apps/web/src/__tests__/App.test.tsx
```

**Result:** Tests pass, hooks remain but untested.

---

## Recommended Approach

**For a clean codebase:** Choose **Option 1** (Delete unused code)

**Why:**
1. ✅ Removes dead code
2. ✅ Eliminates failing tests
3. ✅ Reduces maintenance burden
4. ✅ Follows "delete unused code" best practice
5. ✅ Can always restore from git history if needed

## Complete Cleanup Script

**Run this to fully clean up:**

```bash
# Navigate to project
cd apps/web/src

# Delete unused hooks
rm hooks/useCategories.ts
rm hooks/useProblems.ts
rm hooks/useTags.ts

# Delete their tests
rm hooks/__tests__/useCategories.test.ts
rm hooks/__tests__/useProblems.test.ts
rm hooks/__tests__/useTags.test.ts

# Delete old App files
rm App.tsx.backup
rm __tests__/App.test.tsx

# Update hooks index
cat > hooks/index.ts << 'EOF'
export { usePDFGenerator } from './usePDFGenerator';
EOF

# Verify tests pass
cd ../..
npm test
```

**Expected output:**
```
Test Suites: X passed, X total
Tests:       X passed, X total
```

(No more failing tests for unused hooks!)

---

## File Comparison

### Before Cleanup:

```
src/
  hooks/
    useCategories.ts          # ❌ Unused
    useProblems.ts            # ❌ Unused
    useTags.ts                # ❌ Unused
    usePDFGenerator.ts        # ✅ Still used
    __tests__/
      useCategories.test.ts   # ❌ Failing
      useProblems.test.ts     # ❌ Failing
      useTags.test.ts         # ❌ Failing
    index.ts
  App.tsx.backup              # ❌ Old component
  __tests__/
    App.test.tsx              # ❌ Failing
  routes/
    home.tsx                  # ✅ Uses clientLoader
    category.tsx              # ✅ Uses clientLoader
    worksheet.tsx             # ✅ Uses clientLoader + usePDFGenerator
```

### After Cleanup:

```
src/
  hooks/
    usePDFGenerator.ts        # ✅ Still used
    index.ts                  # ✅ Only exports usePDFGenerator
  routes/
    home.tsx                  # ✅ Uses clientLoader
    category.tsx              # ✅ Uses clientLoader
    worksheet.tsx             # ✅ Uses clientLoader + usePDFGenerator
```

Much cleaner! ✨

---

## What About App.tsx?

**Q:** Should I restore `App.tsx` from backup?

**A:** No! ❌

The old `App.tsx` was replaced by the new route-based structure:

**Old App.tsx did:**
- Managed all state (categories, problems, tags)
- Rendered everything in one component
- Used custom hooks

**New route structure does:**
- Each route manages its own data (via loaders)
- Renders only what's needed for that route
- Uses React Router hooks

**App.tsx.backup is obsolete** - safe to delete.

---

## Summary

**Dead code to remove:**
- `useCategories`, `useProblems`, `useTags` hooks
- Their test files
- `App.tsx.backup`
- `App.test.tsx`

**Active code to keep:**
- `usePDFGenerator` hook (still used in worksheet route)
- All route files (home, category, worksheet)
- Direct API calls (getCategories, getProblems, getTags)

**After cleanup:**
- ✅ No failing tests
- ✅ Cleaner codebase
- ✅ Only used code remains
- ✅ Can restore from git if needed

---

## Alternative: Archive Instead of Delete

If you're hesitant to delete:

```bash
# Create archive folder
mkdir -p apps/web/archived

# Move instead of delete
mv apps/web/src/hooks/useCategories.ts apps/web/archived/
mv apps/web/src/hooks/useProblems.ts apps/web/archived/
mv apps/web/src/hooks/useTags.ts apps/web/archived/
mv apps/web/src/App.tsx.backup apps/web/archived/

# Still remove tests (they'll fail anyway)
rm apps/web/src/hooks/__tests__/useCategories.test.ts
rm apps/web/src/hooks/__tests__/useProblems.test.ts
rm apps/web/src/hooks/__tests__/useTags.test.ts
rm apps/web/src/__tests__/App.test.tsx
```

**Result:** Code archived but tests won't fail.

---

## Next Steps

**After cleanup:**

1. Run tests: `npm test` (should all pass)
2. Check coverage: `npm run test:coverage`
3. Add tests for components (see `TESTING-IMPLEMENTATION-GUIDE.md`)
4. Commit changes: `git add -A && git commit -m "Remove unused hooks after React Router 7 migration"`

**You're now ready to add new tests for the actual components!** 🚀
