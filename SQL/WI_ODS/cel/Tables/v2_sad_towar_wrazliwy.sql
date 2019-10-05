CREATE TABLE [cel].[v2_sad_towar_wrazliwy] (
    [idDokNr]             BIGINT          NOT NULL,
    [PozId]               SMALLINT        NOT NULL,
    [TowarWrazliwy_PozId] SMALLINT        NOT NULL,
    [Kod]                 VARCHAR (2)     NULL,
    [Ilosc]               DECIMAL (14, 3) NULL,
    CONSTRAINT [PK_V2_SAD_TOWAR_WRAZLIWY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [TowarWrazliwy_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_TOW_WRAZ_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

