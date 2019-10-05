CREATE TABLE [vies].[VIES_nabycia] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [NIPNabywcy]      CHAR (10)    NOT NULL,
    [Rok]             SMALLINT     NOT NULL,
    [RodzajOkresu]    CHAR (1)     NOT NULL,
    [NrOkresu]        SMALLINT     NOT NULL,
    [KodKraju]        CHAR (2)     NULL,
    [ZlozenieKorekta] CHAR (1)     NOT NULL,
    [NabycieBezp]     DECIMAL (13) NULL,
    [nabycieTrojstr]  DECIMAL (13) NULL,
    [UrzadSkarbowy]   VARCHAR (4)  NULL,
    [NIPDostawcyZagr] VARCHAR (12) NULL,
    [Okres]           AS           (([RodzajOkresu]+CONVERT([char](4),[Rok]))+right('0'+CONVERT([varchar](2),[NrOkresu]),(2))),
    CONSTRAINT [PK_VIES_nabycia] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_VIES],
    CONSTRAINT [CK_VIES_nabycia_Inicjalnosc] CHECK ([ZlozenieKorekta]='K' OR [ZlozenieKorekta]='P'),
    CONSTRAINT [CK_VIES_nabycia_RodzajOkresu] CHECK ([RodzajOkresu]='K' OR [RodzajOkresu]='M')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VIES_nabycia]
    ON [vies].[VIES_nabycia]([NIPNabywcy] ASC, [Rok] ASC, [RodzajOkresu] ASC, [NrOkresu] ASC, [KodKraju] ASC, [NIPDostawcyZagr] ASC)
    ON [FG_VIES];

