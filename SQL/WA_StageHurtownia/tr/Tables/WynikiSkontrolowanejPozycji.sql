CREATE TABLE [tr].[WynikiSkontrolowanejPozycji] (
    [SIDWynikuSkontrolowanejPozycji] INT          NOT NULL,
    [SIDSkontrolowanejPozycji]       INT          NULL,
    [WskaznikKontroli]               CHAR (2)     NULL,
    [WskaznikDoAtrybutu]             VARCHAR (35) NULL,
    CONSTRAINT [PK_WynikiSkontrolowanejPozycji] PRIMARY KEY CLUSTERED ([SIDWynikuSkontrolowanejPozycji] ASC)
);

