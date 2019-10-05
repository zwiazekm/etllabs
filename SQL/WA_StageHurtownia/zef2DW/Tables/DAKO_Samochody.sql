CREATE TABLE [zef2DW].[DAKO_Samochody] (
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
    [operacja]                  NVARCHAR (1)    NULL
);

