CREATE FUNCTION [dbo].[KonwertujOkresNaDate]
(
	@RokMc int
)
RETURNS DATE
AS
BEGIN
     RETURN DATEFROMPARTS(@RokMc / 100, @RokMc % 100, 1)
END