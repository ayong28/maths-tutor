SELECT *
FROM public."Problem"
WHERE type = 'FRACTION_ADDITION'
-- AND difficulty = 'HARD'
AND tags @> ARRAY['mixed-numbers']
LIMIT 100;

SELECT id,
       type,
       tags
FROM public."Problem"
WHERE 'add-powers' = ANY(tags)
LIMIT 10;

SELECT id,
       type,
       tags
FROM public."Problem"
WHERE tags @> ARRAY['add-powers']
LIMIT 10;

SELECT DISTINCT tag
FROM public."Problem",
     UNNEST(tags) AS tag
ORDER BY tag;

SELECT column_name,
       data_type,
       udt_name,
       is_nullable,
       column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'Problem'
ORDER BY ordinal_position;

