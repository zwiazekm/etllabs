CREATE TABLE [stat].[dot_viesIstatAnalizaSzacowaniePodprNabycia] (
    [nip]               VARCHAR (10) NOT NULL,
    [kod_kraju]         VARCHAR (2)  NULL,
    [rodzaj_transakcji] VARCHAR (2)  NULL,
    [kod_towarowy]      VARCHAR (8)  NULL,
    [kraj_pochodzenia]  VARCHAR (2)  NULL,
    [nabycia_bezposr]   DECIMAL (15) NULL,
    [RokMc]             INT          NOT NULL
);

