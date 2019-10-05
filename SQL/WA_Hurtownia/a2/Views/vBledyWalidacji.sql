CREATE VIEW a2.vBledyWalidacji
as
select 
	  BW.ID
	, BW.Czas 
	, DB_NAME(BW.databaseId) as BazaDanych
	, OBJECT_SCHEMA_NAME(BW.objectId, BW.databaseId) as NazwaSchematu
	, OBJECT_NAME(BW.objectId, BW.databaseId) as NazwaTabeli
	, BW.WalidacjaPDR
	, BW.Kolumna
	, BW.BlednaWartosc
	, BW.KluczWiersza
	, BW.CzyPoprawiony
	, BW.KodKlasyBledu
	, BW.RegulaId
	, KB.NazwaKlasyBledu
	, SH.Nazwa as NazwaSystemu
	, OBJECT_SCHEMA_NAME(BW.objectId, BW.databaseId) + '.' + OBJECT_NAME(BW.objectId, BW.databaseId) as PelnaNazwaTabeli
from a2.BledyWalidacji BW
INNER JOIN a2.slKlasyBledu KB ON KB.KodKlasyBledu = BW.KodKlasyBledu
LEFT JOIN  a2.slSchematy SH   ON SH.Kod = OBJECT_SCHEMA_NAME(BW.objectId)