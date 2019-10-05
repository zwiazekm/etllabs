CREATE TABLE [fk].[Wplaty] (
    [IdDok]            VARCHAR (30)    NOT NULL,
    [NumerPozycji]     SMALLINT        NOT NULL,
    [IdDokStowarzysz]  VARCHAR (30)    NULL,
    [RodzajNaleznosci] VARCHAR (9)     NULL,
    [Korekta]          CHAR (1)        NULL,
    [Kwota]            DECIMAL (19, 2) NULL,
    [OdsetkiZaplacone] DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_Wplaty] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

