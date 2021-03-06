/*
 * Authors : Christopher Miguel
 * Project : Sports de combat
 * Date : 26.01.2020
*/

SELECT T.name AS table_name,
  PS.row_count
FROM sys.dm_db_partition_stats AS PS
JOIN sys.tables AS T ON PS.object_id = T.object_id
WHERE PS.index_id BETWEEN 0 AND 1
ORDER BY T.name;