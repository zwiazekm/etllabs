CREATE TABLE [cel].[v2_towar] (
    [idDokNr]              BIGINT          NOT NULL,
    [PozId]                SMALLINT        NOT NULL,
    [OpisTowaru]           VARCHAR (1000)  NULL,
    [KodTowarowy]          VARCHAR (10)    NULL,
    [LiczbaOpakowan]       INT             NULL,
    [MasaBrutto]           DECIMAL (14, 3) NULL,
    [KrajWysylki]          VARCHAR (2)     NULL,
    [KrajPochodzenia]      VARCHAR (2)     NULL,
    [MasaNetto]            DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJM] DECIMAL (14, 3) NULL,
    [WartoscStatystyczna]  DECIMAL (15)    NULL,
    [NrRejestru]           VARCHAR (35)    NULL,
    [DataRejestru]         DATETIME        NULL,
    [Opakowanie]           VARCHAR (3)     NULL,
    CONSTRAINT [PK_V2_TOWAR] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_TOWAR_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

