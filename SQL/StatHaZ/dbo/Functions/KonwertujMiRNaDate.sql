CREATE FUNCTION [dbo].[KonwertujMiRNaDate]
(
	@miesiac int,
	@rok int
)
RETURNS DATE
AS
BEGIN
     RETURN DATEFROMPARTS(@rok, @miesiac, 1)
END