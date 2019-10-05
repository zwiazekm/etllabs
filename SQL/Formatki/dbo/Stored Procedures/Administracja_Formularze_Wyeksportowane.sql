


CREATE PROCEDURE [dbo].[Administracja_Formularze_Wyeksportowane]
	@FormatkaKod	varchar(5)
AS
	
	select * from dbo.OstatnieWersjeFormularzy
	where FormatkaKod = @FormatkaKod;