CREATE TABLE [cel].[v2_kontener_zamkniecie] (
    [idDokNr]          BIGINT       NOT NULL,
    [PozId]            SMALLINT     NOT NULL,
    [Zamkniecie_PozId] SMALLINT     NOT NULL,
    [Ilosc]            SMALLINT     NULL,
    [Nr]               VARCHAR (20) NULL,
    [Rodzaj]           VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_KONTENER_ZAMKNIECIE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Zamkniecie_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_KONTENER_ZAMK_KONTENER] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_kontener] ([idDokNr], [PozId])
);

