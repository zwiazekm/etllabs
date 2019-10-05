
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Czy_Jednostka_Podrzedna_Dla]
(
	-- Add the parameters for the function here
	@idJednostki int,
	@KodUrzeduNadrzedny varchar(50)
)
RETURNS varchar(1)
AS
BEGIN
	DECLARE @jednostkaId int, @kodUrzedu varchar(50), @nadrzedny varchar(50);
	SET @nadrzedny = '-1';
	SET @jednostkaId = @idJednostki;

	WHILE (@nadrzedny <> '' AND @nadrzedny IS NOT NULL)
	BEGIN
		-- pobiera jednostkę nadrzędną
		SELECT @jednostkaId = so.JednostkaId,
			   @kodUrzedu = so.KodUrzedu,
			   @nadrzedny = so.KodUrzeduNadrzedny 
		FROM StrukturaOrganizacyjna so
		WHERE so.KodUrzedu = (SELECT s.KodUrzeduNadrzedny
									FROM StrukturaOrganizacyjna s
									WHERE s.JednostkaId = @jednostkaId);

		IF @kodUrzedu = @KodUrzeduNadrzedny
			RETURN 'T';

		IF @jednostkaId = @idJednostki
			RETURN 'N';
	END;

	RETURN 'N';

END