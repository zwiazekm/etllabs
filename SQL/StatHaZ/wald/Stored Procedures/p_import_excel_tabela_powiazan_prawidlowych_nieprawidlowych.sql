﻿
CREATE PROCEDURE [wald].[p_import_excel_tabela_powiazan_prawidlowych_nieprawidlowych] AS

EXEC [wald].p_import_excel_tabela_powiazan_nieprawidlowych
EXEC [wald].p_import_excel_tabela_powiazan_prawidlowych
EXEC [wald].p_raport_import_tabel_powiazan_z_xls