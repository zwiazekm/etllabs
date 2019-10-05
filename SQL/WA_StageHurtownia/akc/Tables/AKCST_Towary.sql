CREATE TABLE [akc].[AKCST_Towary] (
    [IdDok]               VARCHAR (30)    NOT NULL,
    [NumerPozycji]        INT             NOT NULL,
    [NazwaGrupyWyrobow]   VARCHAR (255)   NULL,
    [KodCN]               VARCHAR (15)    NULL,
    [KodCNPid]            INT             NULL,
    [StawkaPodatku]       DECIMAL (19, 2) NULL,
    [IloscSuszuTyton]     DECIMAL (19, 6) NULL,
    [KwotaPodatkuAkc]     DECIMAL (19, 2) NULL,
    [ZwolnieniaObnizenia] DECIMAL (19, 2) NULL,
    [WartoscZnakowAkcyzy] DECIMAL (19, 2) NULL,
    [DoZaplatyPoz]        DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKCST_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

