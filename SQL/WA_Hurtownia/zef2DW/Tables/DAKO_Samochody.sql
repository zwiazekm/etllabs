CREATE TABLE [zef2DW].[DAKO_Samochody] (
    [IdentyfikatorWpisu]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [SamochodyMarka]            NVARCHAR (255)  NULL,
    [SamochodyModel]            NVARCHAR (255)  NULL,
    [SamochodyRokProdukcji]     INT             NULL,
    [SamochodyVIN]              NVARCHAR (25)   NULL,
    [SamochodyPojemnosc]        DECIMAL (19, 2) NULL,
    [SamochodyDataZaplaty]      DATE            NULL,
    [SamochodyBlokada]          NVARCHAR (5)    NULL,
    [SamochodyPierwotnePismoId] INT             NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    CONSTRAINT [DAKO_Samochody_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

