CREATE TABLE [cel].[v2_towar] (
    [idDokNr]              BIGINT          NOT NULL,
    [PozId]                SMALLINT        NOT NULL,
    [OpisTowaru]           VARCHAR (1000)  NULL,
    [KodTowarowy]          VARCHAR (10)    NULL,
    [LiczbaOpakowan]       INT             NULL,
    [MasaBrutto]           NUMERIC (14, 3) NULL,
    [KrajWysylki]          VARCHAR (2)     NULL,
    [KrajPochodzenia]      VARCHAR (2)     NULL,
    [MasaNetto]            NUMERIC (14, 3) NULL,
    [IloscUzupelniajacaJM] NUMERIC (14, 3) NULL,
    [WartoscStatystyczna]  NUMERIC (15)    NULL,
    [NrRejestru]           VARCHAR (35)    NULL,
    [DataRejestru]         DATETIME        NULL,
    [Opakowanie]           VARCHAR (3)     NULL,
    CONSTRAINT [PK_V2_TOWAR] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

