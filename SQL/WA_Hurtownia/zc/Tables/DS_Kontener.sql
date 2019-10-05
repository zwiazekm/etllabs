CREATE TABLE [zc].[DS_Kontener] (
    [IdDok]       BIGINT       NOT NULL,
    [IdPozycji]   SMALLINT     NOT NULL,
    [NrKontenera] VARCHAR (17) NULL,
    CONSTRAINT [PK_DS_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_Kontener_IdDok_DS_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DS_Dokument] ([IdDok])
);

