CREATE FUNCTION [dbo].[KonwertujMiRNaMMYY]
(
	@miesiac int,
	@rok int
)
RETURNS CHAR(4)
AS
BEGIN
     RETURN right ('0' + convert (VARCHAR(2), @miesiac), 2) + right ('0' + convert (VARCHAR(4), @rok), 2) 
END