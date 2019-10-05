CREATE TABLE [cel].[v2_dok_powiazania] (
    [idDokNr]        BIGINT          NOT NULL,
    [Typ]            VARCHAR (1)     NOT NULL,
    [PozId]          SMALLINT        NOT NULL,
    [RodzDok]        VARCHAR (4)     NULL,
    [Nr]             VARCHAR (40)    NULL,
    [LiczbaOpakowan] INT             NULL,
    [MasaBrutto]     NUMERIC (14, 3) NULL,
    CONSTRAINT [PK_V2_DOK_POWIAZANIA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [Typ] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

