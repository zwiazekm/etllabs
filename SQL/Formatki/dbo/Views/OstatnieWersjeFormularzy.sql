
CREATE VIEW [dbo].[OstatnieWersjeFormularzy]
AS
SELECT FormatkaKod, ID_SharePoint, Wersja FROM dbo.DGH_Naglowek WHERE Aktualny=1
UNION ALL
SELECT FormatkaKod, ID_SharePoint, Wersja FROM dbo.DIC_Naglowek WHERE Aktualny=1
UNION ALL
SELECT FormatkaKod, ID_SharePoint, Wersja FROM dbo.DSC_Naglowek WHERE Aktualny=1
UNION ALL
SELECT FormatkaKod, ID_SharePoint, Wersja FROM [dbo].[MOR_ANNUAL] WHERE Aktualny=1
UNION ALL
SELECT FormatkaKod, ID_SharePoint, Wersja FROM [dbo].[MOR_QUARTERLY] WHERE Aktualny=1