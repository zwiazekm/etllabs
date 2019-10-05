CREATE TABLE [zc].[SAD_Odbiorca] (
    [IdDok]         BIGINT       NOT NULL,
    [IdPozycji]     SMALLINT     NOT NULL,
    [IdKontrahenta] INT          NOT NULL,
    [EORI]          VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Odbiorca] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdKontrahenta] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Odbiorca_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok]),
    CONSTRAINT [FK_SAD_Odbiorca_IdKontrahenta_SAD_Kontrahent_IdKontrahenta] FOREIGN KEY ([IdKontrahenta]) REFERENCES [zc].[SAD_Kontrahent] ([IdKontrahenta])
);

