CREATE TABLE [cel].[v2_sad_info_dodatkowaWPT] (
    [idDokNr]          BIGINT       NOT NULL,
    [PozId]            SMALLINT     NOT NULL,
    [InfoDodWPT_PozId] SMALLINT     NOT NULL,
    [Kod]              VARCHAR (3)  NULL,
    [WywozZUE]         CHAR (1)     NULL,
    [KrajWywozu]       VARCHAR (2)  NULL,
    [Tekst]            VARCHAR (70) NULL,
    CONSTRAINT [PK_V2_SAD_INFO_DODATKOWAWPT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [InfoDodWPT_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_INF_DODEPT_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

