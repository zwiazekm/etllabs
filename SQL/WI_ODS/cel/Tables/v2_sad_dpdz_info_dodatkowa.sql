CREATE TABLE [cel].[v2_sad_dpdz_info_dodatkowa] (
    [idDokNr]       BIGINT        NOT NULL,
    [PozId]         SMALLINT      NOT NULL,
    [InfoDod_PozId] SMALLINT      NOT NULL,
    [Kod]           VARCHAR (5)   NULL,
    [Tekst]         VARCHAR (255) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_INFO_DODATKOWA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [InfoDod_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_D_INF_DOD_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

