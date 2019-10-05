CREATE TABLE [cel].[v2_sad_opakowanie] (
    [idDokNr]          BIGINT       NOT NULL,
    [PozId]            SMALLINT     NOT NULL,
    [Opakowanie_PozId] SMALLINT     NOT NULL,
    [Rodzaj]           VARCHAR (2)  NULL,
    [Znaki]            VARCHAR (42) NULL,
    [LiczbaOpakowan]   INT          NULL,
    [IloscSztuk]       INT          NULL,
    CONSTRAINT [PK_V2_SAD_OPAKOWANIE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Opakowanie_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_OPAKOW_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

