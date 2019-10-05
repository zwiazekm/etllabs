CREATE PROCEDURE [gust].sp_ExecPackage_czyszczenie_tabeli_kody_cn_sprawdzenie
AS

Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] @package_name=N'01_Czyszczenie_tabeli_Kody_cn_sprawdzenie.dtsx', @execution_id=@execution_id OUTPUT, @folder_name=N'Ariadna2', @project_name=N'StatHaZ_SSIS', @use32bitruntime=False, @reference_id=Null
Select @execution_id
DECLARE @var0 nvarchar(128) = DB_NAME();
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=20, @parameter_name=N'CM.Baza_Gustaw.InitialCatalog', @parameter_value=@var0
DECLARE @var1 bit = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=20, @parameter_name=N'CM.Baza_Gustaw.RetainSameConnection', @parameter_value=@var1
DECLARE @var2 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var2
EXEC [SSISDB].[catalog].[start_execution] @execution_id