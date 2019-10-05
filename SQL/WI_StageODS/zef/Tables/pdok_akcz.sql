CREATE TABLE [zef].[pdok_akcz] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [nr_poz]         INT             NOT NULL,
    [zalacznik]      CHAR (1)        NOT NULL,
    [nazwa_grp]      VARCHAR (255)   NULL,
    [sym_sww]        VARCHAR (15)    NULL,
    [poz_st_pa]      VARCHAR (15)    NULL,
    [il_wyrob]       DECIMAL (24, 6) NULL,
    [il_wyrob_proc]  DECIMAL (24, 6) NULL,
    [st_pod]         NUMERIC (20, 2) NULL,
    [kw_pod]         NUMERIC (20, 2) NULL,
    [nr_poz_slow]    NUMERIC (10)    NULL,
    [tytul]          VARCHAR (10)    NULL,
    [dat_powst_obow] DATETIME        NULL,
    [term_plat]      DATETIME        NULL,
    [termin]         SMALLINT        NULL,
    [nr_poz_ewid]    SMALLINT        NULL,
    [kw_zwol]        NUMERIC (20, 2) NULL,
    [kw_znak]        NUMERIC (20, 2) NULL,
    [il_dod]         NUMERIC (20, 2) NULL,
    CONSTRAINT [PK_PDOK_AKCZ] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC, [zalacznik] ASC)
);

