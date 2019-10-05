CREATE TABLE [vies].[VIES_dostawy] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [NIPDostawcy]     CHAR (10)    NOT NULL,
    [Rok]             SMALLINT     NOT NULL,
    [RodzajOkresu]    CHAR (1)     NOT NULL,
    [NrOkresu]        SMALLINT     NOT NULL,
    [KodKraju]        CHAR (2)     NULL,
    [ZlozenieKorekta] CHAR (1)     NOT NULL,
    [DostawaBezp]     DECIMAL (13) NULL,
    [DostawaTrojstr]  DECIMAL (13) NULL,
    [UrzadSkarbowy]   VARCHAR (4)  NULL,
    [NIPNabywcyZagr]  VARCHAR (12) NULL,
    [Okres]           AS           (([RodzajOkresu]+CONVERT([char](4),[Rok]))+right('0'+CONVERT([varchar](2),[NrOkresu]),(2))),
    CONSTRAINT [PK_VIES_dostawy] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_VIES],
    CONSTRAINT [CK_VIES_dostawy_Inicjalnosc] CHECK ([ZlozenieKorekta]='K' OR [ZlozenieKorekta]='P'),
    CONSTRAINT [CK_VIES_dostawy_RodzajOkresu] CHECK ([RodzajOkresu]='K' OR [RodzajOkresu]='M')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VIES_dostawy]
    ON [vies].[VIES_dostawy]([NIPDostawcy] ASC, [Rok] ASC, [RodzajOkresu] ASC, [NrOkresu] ASC, [KodKraju] ASC, [NIPNabywcyZagr] ASC)
    ON [FG_VIES];

