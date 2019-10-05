CREATE TABLE [zef2DW].[POZA_Dokument] (
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [DataDoreczenia]            DATE            NULL,
    [DataPostanowienia]         DATE            NULL,
    [Instancja]                 NVARCHAR (10)   NULL,
    [NrPostanowieniaIInstancji] NVARCHAR (255)  NULL,
    [RazemKwota]                DECIMAL (19, 2) NULL,
    [RazemOdsetki]              DECIMAL (19, 2) NULL,
    [NumerPostanowienia]        NVARCHAR (255)  NULL,
    [UtrzymanieUchylenie]       NVARCHAR (10)   NULL,
    [AdnotacjeIUwagi]           NVARCHAR (512)  NULL,
    [RwPodstawaPrawna]          NVARCHAR (4000) NULL,
    [RwUzasadnienie]            NVARCHAR (MAX)  NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    [IdentyfikatorPodatnika]    BIGINT          NOT NULL,
    [RazemOplataProlongacyjna]  DECIMAL (19, 4) NULL,
    [NumerWplaty]               NVARCHAR (255)  NULL,
    [DataWplaty]                DATE            NULL,
    [NazwaWplacajacego]         NVARCHAR (4000) NULL,
    CONSTRAINT [POZA_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

