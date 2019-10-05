CREATE TABLE [aimp2].[ZCP_SrodekTaryfowy] (
    [IdWpisu]            NUMERIC (19)  NOT NULL,
    [IdTowarZCP]         NUMERIC (19)  NULL,
    [SrodeArchiwalny]    BIT           NOT NULL,
    [Przypisy]           BIT           NOT NULL,
    [ObszarGeograficzny] NVARCHAR (4)  NULL,
    [IdSrodka]           NVARCHAR (26) NULL,
    [DataRejestracji]    DATETIME2 (3) NULL,
    [NumerWpisu]         NVARCHAR (6)  NULL,
    [Seria]              NVARCHAR (2)  NULL,
    [SID]                NUMERIC (15)  NULL,
    [Typ]                NVARCHAR (3)  NULL,
    [KodUAM]             NVARCHAR (3)  NULL,
    [KwalifikatorUAM]    NVARCHAR (1)  NULL,
    CONSTRAINT [ZCP_SrodekTaryfowy_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC)
);

