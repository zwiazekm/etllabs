CREATE TABLE [aimp2].[ZCP_TowarKontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdTowarZCP]      NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_TowarKontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_TowarKontener$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

