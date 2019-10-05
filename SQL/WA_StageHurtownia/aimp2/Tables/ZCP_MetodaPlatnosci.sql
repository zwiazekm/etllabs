CREATE TABLE [aimp2].[ZCP_MetodaPlatnosci] (
    [IdMetodyPlatnosci]     NUMERIC (19)    NOT NULL,
    [IdTowarZCP]            NUMERIC (19)    NULL,
    [Kwota]                 NUMERIC (16, 2) NULL,
    [KwotaZaplacona]        NUMERIC (16, 6) NULL,
    [KwotaDoZabezpieczenia] NUMERIC (16, 2) NULL,
    [PodstawaOplaty]        NUMERIC (16, 2) NULL,
    [DataPowiadomienia]     DATETIME2 (3)   NULL,
    [DataNotyfikacji]       DATETIME2 (3)   NULL,
    [IdPODZ]                NUMERIC (19)    NULL,
    [KwotaZabezpieczona]    BIT             NOT NULL,
    [MetodaPlatnosci]       NVARCHAR (1)    NULL,
    [MetodaPlatnosciPid]    INT             NULL,
    [Stawka]                NUMERIC (17, 2) NULL,
    [StylWiersza]           NVARCHAR (1)    NULL,
    [TypOplaty]             NVARCHAR (3)    NULL,
    [TypOplatyPid]          INT             NULL,
    [DanePokontrolne]       NTEXT           NULL,
    CONSTRAINT [ZCP_MetodaPlatnosci_PK] PRIMARY KEY CLUSTERED ([IdMetodyPlatnosci] ASC)
);

