--create procedure stat.dop_wyznaczObrotyWVies
--@p_rok int
--as
--begin
--  declare @rok_ubiegly int = @p_rok - 1;

--  exec stat.dop_vies1i2_PolaczKwartalneZMiesiecznymi @p_rok;

--  truncate table stat.dot_obrotyMiesieczneWVies;


--  insert into stat.dot_obrotyMiesieczneWVies
--  select m.NIPNabywcy,
--         m.[RokMc],
--		 SUM(m.nabycie_bezposrednie) wartosc_obrotow,
--		 'P' typ
--    from stat.dot_viesNabyciaKM m
--   group by m.NIPNabywcy, m.[RokMc];


--  --declare @p_rok int = 2013;
--  insert into stat.dot_obrotyMiesieczneWVies
--  select m.NIPDostawcy,
--         m.RokMc,
--		 SUM(m.dostawa_bezposrednia) wartosc_obrotow,
--		 'W' typ
--    from stat.dot_viesDostawyKM m
--   group by m.NIPDostawcy, m.RokMc;

--  exec stat.dop_vies1i2_PolaczKwartalneZMiesiecznymi @rok_ubiegly;

--  insert into stat.dot_obrotyMiesieczneWVies
--  select m.NIPNabywcy,
--         m.RokMc,
--		 SUM(m.nabycie_bezposrednie) wartosc_obrotow,
--		 'P' typ
--    from stat.dot_viesNabyciaKM m
--   group by m.NIPNabywcy, m.[RokMc];

--  insert into stat.dot_obrotyMiesieczneWVies
--  select m.NIPDostawcy,
--         m.RokMc,
--		 SUM(m.dostawa_bezposrednia) wartosc_obrotow,
--		 'W' typ
--    from stat.dot_viesDostawyKM m
--   group by m.NIPDostawcy, m.RokMc;

--end;