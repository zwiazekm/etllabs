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
    CONSTRAINT [PK_VIES_dostawy] PRIMARY KEY CLUSTERED ([Id] ASC)
);

