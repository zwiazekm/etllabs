CREATE TABLE [zc].[DS_Powiazanie] (
    [IdDok]          BIGINT          NOT NULL,
    [Typ]            CHAR (1)        NOT NULL,
    [IdPozycji]      SMALLINT        NOT NULL,
    [MasaBrutto]     DECIMAL (14, 3) NULL,
    [LiczbaOpakowan] INT             NULL,
    [RodzajDok]      VARCHAR (4)     NULL,
    [NrEwiden]       VARCHAR (40)    NULL,
    CONSTRAINT [PK_DS_Powiazanie] PRIMARY KEY CLUSTERED ([Typ] ASC, [IdDok] ASC, [IdPozycji] ASC)
);

