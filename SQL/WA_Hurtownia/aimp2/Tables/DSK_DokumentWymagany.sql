CREATE TABLE [aimp2].[DSK_DokumentWymagany] (
    [IdDokWym]   NUMERIC (19)  NOT NULL,
    [IdTowarDSK] NUMERIC (19)  NULL,
    [Kod]        NCHAR (4)     NULL,
    [KodPid]     INT           NULL,
    [Numer]      NVARCHAR (35) NULL,
    [Uwagi]      NVARCHAR (35) NULL,
    CONSTRAINT [DSK_DokumentWymagany_PK] PRIMARY KEY CLUSTERED ([IdDokWym] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_DokumentWymagany$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

