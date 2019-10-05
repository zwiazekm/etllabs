CREATE TABLE [zc].[DPDZ_Powiazanie] (
    [IdDok]          BIGINT          NOT NULL,
    [Typ]            CHAR (1)        NOT NULL,
    [IdPozycji]      SMALLINT        NOT NULL,
    [RodzajDok]      VARCHAR (4)     NULL,
    [NrEwidencyjny]  VARCHAR (40)    NULL,
    [LiczbaOpakowan] INT             NULL,
    [MasaBrutto]     DECIMAL (14, 3) NULL,
    CONSTRAINT [PK_DPDZ_Powiazanie] PRIMARY KEY CLUSTERED ([Typ] ASC, [IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Powiazanie_IdDok_DPDZ_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DPDZ_Dokument] ([IdDok])
);

