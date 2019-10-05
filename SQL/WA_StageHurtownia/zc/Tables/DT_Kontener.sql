CREATE TABLE [zc].[DT_Kontener] (
    [IdDok]       VARCHAR (30) NOT NULL,
    [IdPozycji]   TINYINT      NOT NULL,
    [NrKontenera] VARCHAR (40) NULL,
    CONSTRAINT [PK_DT_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

