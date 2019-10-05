CREATE TABLE [zc].[SAD_Powiazanie] (
    [IdDok]          BIGINT          NOT NULL,
    [Typ]            CHAR (1)        NOT NULL,
    [IdPozycji]      SMALLINT        NOT NULL,
    [RodzajDok]      VARCHAR (4)     NULL,
    [NrEwidencyjny]  VARCHAR (40)    NULL,
    [LiczbaOpakowan] INT             NULL,
    [MasaBrutto]     DECIMAL (14, 3) NULL,
    CONSTRAINT [PK_SAD_Powiazanie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [Typ] ASC, [IdPozycji] ASC)
);

