CREATE TABLE [zef].[ew_nal_agr] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [id_jedn]        VARCHAR (20)    NULL,
    [id_rodz_dok]    CHAR (4)        NULL,
    [id_komor]       VARCHAR (20)    NOT NULL,
    [id_kontr]       NUMERIC (10)    NOT NULL,
    [sym_dok]        VARCHAR (30)    NULL,
    [dat_wystaw_dok] DATETIME        NULL,
    [term_plat]      DATETIME        NULL,
    [kwota_dok]      NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [kwota_nal]      NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [kwota_wpl]      NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [saldo]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [stat_spraw]     CHAR (1)        NULL,
    [stat_poprz]     CHAR (1)        NULL,
    [kntr_dodat]     CHAR (1)        NULL,
    [plat_id_komor]  VARCHAR (20)    NULL,
    [plat_id_kontr]  NUMERIC (10)    NULL,
    [data_rozl]      DATETIME        NULL,
    [id_dok_stow]    VARCHAR (30)    NULL,
    [sym_dok_stow]   VARCHAR (30)    NULL,
    CONSTRAINT [PK_EW_NAL_AGR] PRIMARY KEY CLUSTERED ([id_dok] ASC, [id_komor] ASC, [id_kontr] ASC) ON [FG_ZEF]
);

