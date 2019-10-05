CREATE TABLE [aimp2].[DSK_Kontener] (
    [IdKontenera]    NUMERIC (19)  NOT NULL,
    [IdDok]          NUMERIC (19)  NOT NULL,
    [NumerKontenera] NVARCHAR (17) NOT NULL,
    CONSTRAINT [DSK_Kontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_Kontener$FK_DSK_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[DSK_Dokument] ([IdDok])
);

