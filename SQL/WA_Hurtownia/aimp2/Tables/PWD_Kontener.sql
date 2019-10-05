CREATE TABLE [aimp2].[PWD_Kontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdTowarPWD]      NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [PWD_Kontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_Kontener$FK_PWD_Towar] FOREIGN KEY ([IdTowarPWD]) REFERENCES [aimp2].[PWD_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

