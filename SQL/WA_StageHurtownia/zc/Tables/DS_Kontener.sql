CREATE TABLE [zc].[DS_Kontener] (
    [IdDok]       BIGINT       NOT NULL,
    [IdPozycji]   SMALLINT     NOT NULL,
    [NrKontenera] VARCHAR (17) NULL,
    CONSTRAINT [PK_DS_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

