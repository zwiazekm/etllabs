CREATE TABLE [zc].[SAD_SrodekPrzewozowy] (
    [IdDok]                  BIGINT          NOT NULL,
    [IdPozycji]              SMALLINT        NOT NULL,
    [IdPozycjiSrodekPrzewoz] SMALLINT        NOT NULL,
    [Identyfikator]          DECIMAL (15)    NULL,
    [Seria]                  CHAR (2)        NULL,
    [Typ]                    VARCHAR (6)     NULL,
    [SrodkiGEO]              VARCHAR (4)     NULL,
    [SrodkiGEOPid]           INT             NULL,
    [NrPorzadkowy]           VARCHAR (6)     NULL,
    [Ujm]                    CHAR (3)        NULL,
    [UjmPid]                 INT             NULL,
    [KwalifikatorUjm]        CHAR (1)        NULL,
    [KwalifikatorUjmPid]     INT             NULL,
    [ZdefiniowanaJm]         CHAR (2)        NULL,
    [RaportowanaIlosc]       DECIMAL (21, 5) NULL,
    CONSTRAINT [PK_SAD_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiSrodekPrzewoz] ASC)
);

