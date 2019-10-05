CREATE FUNCTION [dbo].[KonwertujOkresNaMMYY] (	@RokMc int )
RETURNS CHAR(4)
AS
BEGIN
	RETURN right ('0' + convert (varchar(2), @RokMc % 100), 2) + right ('0' + convert (varchar(4), @RokMc/100), 2) 
END