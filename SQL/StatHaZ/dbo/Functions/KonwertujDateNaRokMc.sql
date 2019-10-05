CREATE FUNCTION [dbo].[KonwertujDateNaRokMc]
(
	@data date
)
RETURNS INT
AS
BEGIN
     RETURN YEAR(@data) * 100 + MONTH(@data);
END