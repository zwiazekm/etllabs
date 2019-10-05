CREATE TABLE [aimp2].[ZCP_Samochody] (
    [IdWpisu]         NUMERIC (19)  NOT NULL,
    [IdTowarZCP]      NUMERIC (19)  NULL,
    [NumerNadwozia]   NVARCHAR (35) NULL,
    [Pojemnosc]       NUMERIC (5)   NULL,
    [NumerSilnika]    NVARCHAR (35) NULL,
    [RodzajPaliwa]    NVARCHAR (2)  NULL,
    [RodzajPaliwaPid] INT           NULL,
    [Marka]           NVARCHAR (35) NULL,
    [MarkaPid]        INT           NULL,
    [Model]           NVARCHAR (35) NOT NULL,
    [RokProdukcji]    NUMERIC (4)   NULL,
    CONSTRAINT [ZCP_Samochody_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Samochody$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
);

