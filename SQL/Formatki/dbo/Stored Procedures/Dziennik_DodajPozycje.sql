CREATE PROCEDURE [dbo].[Dziennik_DodajPozycje]
(
	@Status		char(1),
	@Komunikat	nvarchar(1900),
	@DocId		varchar(40),
	@Operacja	nvarchar(50),
	@Uzytkownik	nvarchar(260) = null

)
AS
	
	INSERT INTO Dziennik	
		(
			Data,
			[Status],
			Komunikat,
			DocId,
			Operacja,
			Uzytkownik
		)
		VALUES
		(
			getdate(),
			@Status,
			@Komunikat,
			@DocId,
			@Operacja,
			@Uzytkownik
		)

RETURN 0