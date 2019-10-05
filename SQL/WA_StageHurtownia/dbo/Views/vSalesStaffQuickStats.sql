

--CREATE VIEW vSalesStaffQuickStats
--AS
-- WITH CTE_s007(s007_id, code) AS
--  (
--    SELECT max(s007_id), code
--    FROM WA_Hurtownia.pdr.s007
--	group by code
--  )
--  SELECT id as ZWU_Towar_id, CTE_s007.s007_id as KrajPochodzeniaPid
--  FROM [aes2].[ZWU_Towar]
--  INNER JOIN CTE_s007 ON CTE_s007.code = ZWU_Towar.KrajPochodzenia



-- SELECT * from aes2.ZWU_Towar
-- truncate table  aes2.ZWU_Towar