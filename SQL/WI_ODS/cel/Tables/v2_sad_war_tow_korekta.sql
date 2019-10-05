CREATE TABLE [cel].[v2_sad_war_tow_korekta] (
    [idDokNr]       BIGINT          NOT NULL,
    [PozId]         SMALLINT        NOT NULL,
    [Korekta_PozId] SMALLINT        NOT NULL,
    [Kod]           VARCHAR (5)     NULL,
    [Wartosc]       DECIMAL (17, 2) NULL,
    CONSTRAINT [PK_V2_SAD_WAR_TOW_KOREKTA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Korekta_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_WAR_T_KOR_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

