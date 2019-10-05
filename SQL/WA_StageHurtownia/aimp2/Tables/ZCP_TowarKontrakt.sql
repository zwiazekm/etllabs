CREATE TABLE [aimp2].[ZCP_TowarKontrakt] (
    [IdKontraktu]    NUMERIC (19)  NOT NULL,
    [IdTowarZCP]     NUMERIC (19)  NULL,
    [DataKontraktu]  DATETIME2 (3) NULL,
    [NumerKontraktu] NVARCHAR (35) NULL,
    CONSTRAINT [ZCP_TowarKontrakt_PK] PRIMARY KEY CLUSTERED ([IdKontraktu] ASC)
);

