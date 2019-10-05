CREATE VIEW [pdr].[v350234]
AS
SELECT 100000+[c3502_id] as [c350234_id], [code], [nazwa], [creation_tm], [last_modification_tm], [valid_from], [valid_to], [version_] FROM pdr.c3502
UNION ALL
SELECT 200000+[c3503_id] as [c350234_id], [code], [nazwa], [creation_tm], [last_modification_tm], [valid_from], [valid_to], [version_] FROM pdr.c3503
UNION ALL
SELECT 300000+[c3504_id] as [c350234_id], [code], [nazwa], [creation_tm], [last_modification_tm], [valid_from], [valid_to], [version_] FROM pdr.c3504
;