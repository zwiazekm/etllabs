CREATE TABLE [zc].[PSP_Powiazanie] (
    [IdDok]         VARCHAR (30) NOT NULL,
    [Typ]           CHAR (1)     NOT NULL,
    [IdPozycji]     INT          NOT NULL,
    [NrEwidencyjny] VARCHAR (40) NULL,
    [RodzajDok]     VARCHAR (4)  NULL,
    CONSTRAINT [PK_PSP_Powiazanie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [Typ] ASC, [IdPozycji] ASC)
);

