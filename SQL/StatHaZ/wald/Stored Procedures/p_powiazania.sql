
CREATE PROCEDURE [wald].[p_powiazania] AS

exec [wald].p_powiazania_prawidlowe
exec [wald].p_powiazania_nieprawidlowe
exec [wald].p_raport_sprawdzenie_powiazan