CREATE TABLE [zc].[SAD_Nadawca] (
    [IdDok]         BIGINT       NOT NULL,
    [IdPozycji]     SMALLINT     NOT NULL,
    [IdKontrahenta] INT          NOT NULL,
    [EORI]          VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Nadawca] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdKontrahenta] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Nadawca_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok]),
    CONSTRAINT [FK_SAD_Nadawca_IdKontrahenta_SAD_Kontrahent_IdKontrahenta] FOREIGN KEY ([IdKontrahenta]) REFERENCES [zc].[SAD_Kontrahent] ([IdKontrahenta])
);

