/**
 * Fix missing type field in mixed-number JSON files
 */

import * as fs from 'fs';
import * as path from 'path';

const tempDir = path.join(__dirname, '..', 'temp');

const files = [
  { name: 'mixed-number-addition-problems.json', type: 'FRACTION_ADDITION' },
  { name: 'mixed-number-subtraction-problems.json', type: 'FRACTION_SUBTRACTION' }
];

for (const { name, type } of files) {
  const filePath = path.join(tempDir, name);
  const content = fs.readFileSync(filePath, 'utf-8');
  const problems = JSON.parse(content);

  const updated = problems.map((p: any) => ({
    ...p,
    type
  }));

  fs.writeFileSync(filePath, JSON.stringify(updated, null, 2));
  console.log(`✓ Fixed ${name} (added type: ${type})`);
}

console.log('\nDone! Re-run the import script.');
