CREATE TABLE [zc].[SAD_Kontener] (
    [IdDok]             BIGINT       NOT NULL,
    [IdPozycji]         SMALLINT     NOT NULL,
    [IdPozycjiKontener] SMALLINT     NOT NULL,
    [NrKontenera]       VARCHAR (17) NULL,
    CONSTRAINT [PK_SAD_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKontener] ASC)
);

