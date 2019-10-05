CREATE TABLE [zef2DW].[IOZA_Dokument] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [IdentyfikatorPodatnika]     BIGINT          NOT NULL,
    [Instancja]                  NVARCHAR (255)  NULL,
    [SygnaturaPostanowieniaSadu] NVARCHAR (255)  NULL,
    [DataPostanowienia]          DATE            NULL,
    [DataDoreczenia]             DATE            NULL,
    [NumerPostanowienia]         NVARCHAR (255)  NULL,
    [NumerWplaty]                NVARCHAR (255)  NULL,
    [DataWplaty]                 DATE            NULL,
    [NazwaWplacajacego]          NVARCHAR (4000) NULL,
    [UtrzymanieUchylenie]        NVARCHAR (10)   NULL,
    [SumaNaleznosci]             DECIMAL (19, 4) NULL,
    [SumaOdsetek]                DECIMAL (19, 4) NULL,
    [SumaOplatProlongacyjnych]   DECIMAL (19, 4) NULL,
    [AdnotacjeIUwagi]            NVARCHAR (255)  NULL,
    [PodstawaPrawna]             NVARCHAR (4000) NULL,
    [Uzasadnienie]               NVARCHAR (4000) NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [IOZA_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

