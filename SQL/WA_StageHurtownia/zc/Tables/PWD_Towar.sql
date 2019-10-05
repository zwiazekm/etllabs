CREATE TABLE [zc].[PWD_Towar] (
    [IdDok]                BIGINT          NOT NULL,
    [IdPozycji]            SMALLINT        NOT NULL,
    [KodTowarowy]          VARCHAR (10)    NULL,
    [KodTowarowyPid]       INT             NULL,
    [KrajPochodzenia]      CHAR (2)        NULL,
    [KrajPochodzeniaPid]   INT             NULL,
    [OpisTowaru]           VARCHAR (1000)  NULL,
    [KrajWysylki]          CHAR (2)        NULL,
    [KrajWysylkiPid]       INT             NULL,
    [IloscUzupelniajacaJm] DECIMAL (14, 3) NULL,
    [MasaNetto]            DECIMAL (14, 3) NULL,
    [WartoscStatystyczna]  DECIMAL (15)    NULL,
    [DataRejestru]         DATETIME        NULL,
    [NrRejestru]           VARCHAR (35)    NULL,
    CONSTRAINT [PK_PWD_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

