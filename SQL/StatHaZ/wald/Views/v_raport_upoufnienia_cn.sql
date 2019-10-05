
CREATE VIEW wald.v_raport_upoufnienia_cn
AS 
	SELECT Opis, Ilosc, Data FROM wald.raport
	WHERE  (Akcja = 'U') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))