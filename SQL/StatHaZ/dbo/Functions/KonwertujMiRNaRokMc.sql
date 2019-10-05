CREATE FUNCTION [dbo].[KonwertujMiRNaRokMc]
(
	@miesiac int,
	@rok int
)
RETURNS INT
AS
BEGIN
     RETURN @rok * 100 + @miesiac;
END