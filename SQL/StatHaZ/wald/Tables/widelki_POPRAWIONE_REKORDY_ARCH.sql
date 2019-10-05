CREATE TABLE [wald].[widelki_POPRAWIONE_REKORDY_ARCH] (
    [znak]             VARCHAR (10)  NOT NULL,
    [typ]              VARCHAR (1)   NULL,
    [tabela]           VARCHAR (100) NOT NULL,
    [bledna_wartosc]   VARCHAR (100) NULL,
    [nowa_wartosc]     VARCHAR (100) NULL,
    [idDokNr]          BIGINT        NULL,
    [id_dok]           VARCHAR (35)  NULL,
    [idDokNr_pozid]    BIGINT        NULL,
    [id_dok_pozid]     BIGINT        NULL,
    [kod_towarowy]     VARCHAR (8)   NULL,
    [kraj_poch_przezn] VARCHAR (2)   NULL,
    [wartosc]          DECIMAL (15)  NULL,
    [okres_od]         VARCHAR (6)   NOT NULL,
    [okres_do]         VARCHAR (6)   NOT NULL,
    [generacjaId]      INT           NOT NULL,
    [uname]            VARCHAR (50)  CONSTRAINT [DF_widelki_POPRAWIONE_REKORDY_ARCH_uname] DEFAULT (suser_sname()) NOT NULL,
    [kiedy]            DATETIME      CONSTRAINT [DF_widelki_POPRAWIONE_REKORDY_ARCH_kiedy] DEFAULT (getdate()) NULL,
    [bd_pk]            BIGINT        IDENTITY (1, 1) NOT NULL
) ON [WaldDane];

