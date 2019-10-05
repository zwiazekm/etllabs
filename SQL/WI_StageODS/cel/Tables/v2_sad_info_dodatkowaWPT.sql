CREATE TABLE [cel].[v2_sad_info_dodatkowaWPT] (
    [idDokNr]          BIGINT       NOT NULL,
    [PozId]            SMALLINT     NOT NULL,
    [InfoDodWPT_PozId] SMALLINT     NOT NULL,
    [Kod]              VARCHAR (3)  NULL,
    [WywozZUE]         VARCHAR (1)  NULL,
    [KrajWywozu]       VARCHAR (2)  NULL,
    [Tekst]            VARCHAR (70) NULL,
    CONSTRAINT [PK_V2_SAD_INFO_DODATKOWAWPT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [InfoDodWPT_PozId] ASC) WITH (FILLFACTOR = 90)
);

