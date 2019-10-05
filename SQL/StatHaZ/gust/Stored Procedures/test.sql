CREATE PROCEDURE gust.test

AS

IF (select count(CN) from gust.Kody_CN_Sprawdzenie) = 0 
 begin
select *
	FROM gust.Kody_CN_Sprawdzenie
 end
 Else 
print 'ddddddddddddddddddddd'