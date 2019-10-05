CREATE FUNCTION [dbo].[RokMcMinusMc]
(
	@RokMc int
)
RETURNS INT
AS
BEGIN
     declare @i int = @RokMc - 1;
	 IF @i%100=0  set @i = @i-100+12; 
	 RETURN @i;
END