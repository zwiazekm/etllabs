CREATE TABLE [zc].[PW_Kontener] (
    [IdDok]       VARCHAR (30) NOT NULL,
    [IdPozycji]   TINYINT      NOT NULL,
    [NrKontenera] VARCHAR (40) NULL,
    CONSTRAINT [PK_PW_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

