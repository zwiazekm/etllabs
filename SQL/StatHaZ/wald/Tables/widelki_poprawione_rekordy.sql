CREATE TABLE [wald].[widelki_poprawione_rekordy] (
    [znak]              VARCHAR (10)  NOT NULL,
    [typ]               VARCHAR (1)   NULL,
    [tabela]            VARCHAR (100) NOT NULL,
    [bledna_wartosc]    VARCHAR (100) NULL,
    [nowa_wartosc]      VARCHAR (100) NULL,
    [idDokNr]           BIGINT        NULL,
    [id_dok]            VARCHAR (35)  NULL,
    [idDokNr_pozid]     BIGINT        NULL,
    [id_dok_pozid]      BIGINT        NULL,
    [kod_towarowy]      VARCHAR (8)   NULL,
    [kraj_poch_przezn]  VARCHAR (2)   NULL,
    [wartosc_fakt_stat] DECIMAL (15)  NULL,
    [generacjaId]       INT           NOT NULL,
    [uname]             VARCHAR (50)  NOT NULL,
    [bd_pk]             BIGINT        IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_widelki_POPRAWIONE_REKORDY] PRIMARY KEY NONCLUSTERED ([bd_pk] ASC) ON [WaldDane]
);


GO
CREATE CLUSTERED INDEX [widelki_POPRAWIONE_REKORDY_znak_cn_kraj]
    ON [wald].[widelki_poprawione_rekordy]([znak] ASC, [kod_towarowy] ASC, [kraj_poch_przezn] ASC)
    ON [WaldDane];

