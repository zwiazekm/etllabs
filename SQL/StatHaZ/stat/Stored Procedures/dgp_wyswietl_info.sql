






CREATE PROCEDURE [stat].dgp_wyswietl_info
  @in_id bigint = 0
as
 select a.in_id,
        a.in_opis, 
        a.in_czas od,
        isnull (b.in_czas, getdate ()) do,
        convert (varchar, (datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) / 60) * 1) + '.' +
        right ('0' + convert (varchar, (datediff (ss, a.in_czas, isnull (b.in_czas, getdate ())) % 60) * 1), 2) czas
   from dgt_info a
   left join dgt_info b on a.in_id = b.in_id - 1
   where a.in_id > @in_id
  order by a.in_id desc