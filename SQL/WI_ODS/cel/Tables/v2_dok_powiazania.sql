CREATE TABLE [cel].[v2_dok_powiazania] (
    [idDokNr]        BIGINT          NOT NULL,
    [Typ]            CHAR (1)        NOT NULL,
    [PozId]          SMALLINT        NOT NULL,
    [RodzDok]        VARCHAR (4)     NULL,
    [Nr]             VARCHAR (40)    NULL,
    [LiczbaOpakowan] INT             NULL,
    [MasaBrutto]     DECIMAL (14, 3) NULL,
    CONSTRAINT [PK_V2_DOK_POWIAZANIA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [Typ] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_POWIAZ_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

