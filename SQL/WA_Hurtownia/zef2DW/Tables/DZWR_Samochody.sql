CREATE TABLE [zef2DW].[DZWR_Samochody] (
    [IdentyfikatorWpisu]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [SamochodyMarka]            NVARCHAR (32)   NULL,
    [SamochodyModel]            NVARCHAR (32)   NULL,
    [SamochodyRokProdukcji]     NVARCHAR (255)  NULL,
    [SamochodyVIN]              NVARCHAR (25)   NULL,
    [SamochodyPojemnosc]        DECIMAL (19, 2) NULL,
    [SamochodyDataZaplaty]      DATE            NULL,
    [SamochodyZwrotCzesciowy]   NVARCHAR (5)    NULL,
    [SamochodyZwrotCalkowity]   NVARCHAR (5)    NULL,
    [SamochodyNumerDokumentu]   NVARCHAR (255)  NULL,
    [SamochodyPierwotnyPismoId] NVARCHAR (255)  NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    CONSTRAINT [DZWR_Samochody_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

