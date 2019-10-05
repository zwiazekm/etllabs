CREATE VIEW [stat].[dgv_info]
AS
 select a.in_id,
        a.in_opis, 
        a.in_czas od,
        isnull (b.in_czas, getdate ()) do,
        convert (varchar, (datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) / 60) * 1) + '.' +
        right ('0' + convert (varchar, (datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) % 60) * 1), 2) + ' min' as CzasStr,
		datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) as CzasSek,
		datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) / 60.0 as CzasMin
   from stat.dgt_info a (NOLOCK)
   left join stat.dgt_info b (NOLOCK) on a.in_id = b.in_id - 1