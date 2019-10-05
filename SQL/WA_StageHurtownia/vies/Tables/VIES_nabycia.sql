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
    CONSTRAINT [PK_VIES_nabycia] PRIMARY KEY CLUSTERED ([Id] ASC)
);

