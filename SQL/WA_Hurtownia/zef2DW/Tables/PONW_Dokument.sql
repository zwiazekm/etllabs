CREATE TABLE [zef2DW].[PONW_Dokument] (
    [IdentyfikatorDokumentu]          BIGINT         NOT NULL,
    [DataDoreczenia]                  DATE           NULL,
    [DataWystawienia]                 DATE           NULL,
    [NumerPostanowieniaNadaniaRygoru] NVARCHAR (255) NULL,
    [PierwotneNumer]                  NVARCHAR (255) NULL,
    [PierwotneRodzaj]                 NVARCHAR (255) NULL,
    [NumerDokumentu]                  NVARCHAR (255) NULL,
    [UtrzymanieUchylenie]             NVARCHAR (10)  NULL,
    [AdnotacjeIUwagi]                 NVARCHAR (512) NULL,
    [StatusSK]                        NVARCHAR (255) NULL,
    [Instancja]                       NVARCHAR (255) NULL,
    [DataArch]                        DATE           NULL,
    [ID_Pismo_xml]                    BIGINT         NULL,
    [IdentyfikatorPodatnika]          BIGINT         NOT NULL,
    [RaportWyslaniaSK]                NVARCHAR (255) NULL,
    CONSTRAINT [PONW_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

