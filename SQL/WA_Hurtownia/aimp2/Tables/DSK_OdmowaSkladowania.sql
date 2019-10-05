CREATE TABLE [aimp2].[DSK_OdmowaSkladowania] (
    [IdOdmowy]             NUMERIC (19)    NOT NULL,
    [IdTowarDSK]           NUMERIC (19)    NULL,
    [OpisNieprawidlowosci] NVARCHAR (1024) NULL,
    [TrescUzasadnienia]    NVARCHAR (256)  NULL,
    CONSTRAINT [DSK_OdmowaSkladowania_PK] PRIMARY KEY CLUSTERED ([IdOdmowy] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_OdmowaSkladowania$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

