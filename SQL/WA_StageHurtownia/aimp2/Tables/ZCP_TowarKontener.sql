CREATE TABLE [aimp2].[ZCP_TowarKontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdTowarZCP]      NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_TowarKontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC)
);

