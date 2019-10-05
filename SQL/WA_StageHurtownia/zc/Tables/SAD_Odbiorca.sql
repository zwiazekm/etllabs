CREATE TABLE [zc].[SAD_Odbiorca] (
    [IdDok]         BIGINT       NOT NULL,
    [IdPozycji]     SMALLINT     NOT NULL,
    [IdKontrahenta] INT          NOT NULL,
    [EORI]          VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Odbiorca] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdKontrahenta] ASC)
);

