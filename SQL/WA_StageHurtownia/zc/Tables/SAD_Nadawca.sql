CREATE TABLE [zc].[SAD_Nadawca] (
    [IdDok]         BIGINT       NOT NULL,
    [IdPozycji]     SMALLINT     NOT NULL,
    [IdKontrahenta] INT          NOT NULL,
    [EORI]          VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Nadawca] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdKontrahenta] ASC)
);

