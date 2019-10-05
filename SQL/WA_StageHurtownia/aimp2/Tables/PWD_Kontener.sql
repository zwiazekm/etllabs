CREATE TABLE [aimp2].[PWD_Kontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdTowarPWD]      NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [PWD_Kontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC)
);

