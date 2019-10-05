CREATE TABLE [zc].[DPDZ_Srodek] (
    [IdDok]              BIGINT          NOT NULL,
    [IdPozycji]          SMALLINT        NOT NULL,
    [IdPozycjiSrodek]    SMALLINT        NOT NULL,
    [IdSrodka]           DECIMAL (15)    NULL,
    [Seria]              VARCHAR (2)     NULL,
    [Typ]                VARCHAR (6)     NULL,
    [GEO]                VARCHAR (4)     NULL,
    [GEOPid]             INT             NULL,
    [NrPorzadkowy]       VARCHAR (6)     NULL,
    [KodUjm]             CHAR (3)        NULL,
    [KodUjmPid]          INT             NULL,
    [KwalifikatorUjm]    CHAR (1)        NULL,
    [KwalifikatorUjmPid] INT             NULL,
    [ZdefiniowanaJm]     CHAR (2)        NULL,
    [RaportowanaIlosc]   DECIMAL (21, 5) NULL,
    CONSTRAINT [PK_DPDZ_Srodek] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiSrodek] ASC)
);

