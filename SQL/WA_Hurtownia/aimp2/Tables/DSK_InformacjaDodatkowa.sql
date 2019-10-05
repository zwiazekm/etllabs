CREATE TABLE [aimp2].[DSK_InformacjaDodatkowa] (
    [IdInfDod]        NUMERIC (19)   NOT NULL,
    [IdDok]           NUMERIC (19)   NULL,
    [IdTowarDSK]      NUMERIC (19)   NULL,
    [KodInfDodatk]    NCHAR (5)      NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    CONSTRAINT [DSK_InformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInfDod] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_InformacjaDodatkowa$FK_DSK_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[DSK_Dokument] ([IdDok]),
    CONSTRAINT [DSK_InformacjaDodatkowa$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

