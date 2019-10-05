CREATE TABLE [zef].[dokumenty] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [id_jedn]        VARCHAR (20)    NULL,
    [id_rodz_dok]    CHAR (4)        NULL,
    [id_dok_stow]    VARCHAR (30)    NULL,
    [id_dok_nadrz]   VARCHAR (30)    NULL,
    [kntr_id_komor]  VARCHAR (20)    NULL,
    [kntr_id_kontr]  NUMERIC (10)    NULL,
    [kntr_id_centr]  NUMERIC (10)    NULL,
    [rok]            SMALLINT        NULL,
    [id_stanow]      SMALLINT        NULL,
    [nr_dok]         INT             NULL,
    [sym_dok]        VARCHAR (30)    NULL,
    [dat_wystaw_dok] DATETIME        NULL,
    [operator]       VARCHAR (15)    NULL,
    [dat_ksieg]      DATETIME        NULL,
    [operat_ksieg]   VARCHAR (15)    NULL,
    [status]         CHAR (1)        NULL,
    [adnotacje]      VARCHAR (255)   NULL,
    [uwagi]          VARCHAR (255)   NULL,
    [semafor]        VARCHAR (40)    NULL,
    [dat_zamkn]      DATETIME        NULL,
    [id_zrodla]      VARCHAR (6)     NULL,
    [tyt_plat]       VARCHAR (9)     NULL,
    [etap_przetw]    CHAR (1)        NULL,
    [sym_dok_stow]   VARCHAR (30)    NULL,
    [id_mod]         CHAR (6)        NULL,
    [nr_pol_ksieg]   VARCHAR (30)    NULL,
    [waluta]         VARCHAR (6)     NULL,
    [kurs]           NUMERIC (20, 6) DEFAULT ((1)) NULL,
    CONSTRAINT [PK_DOKUMENTY] PRIMARY KEY CLUSTERED ([id_dok] ASC) ON [FG_ZEF],
    CONSTRAINT [CKC_DAT_KSIEG_DOKUMENT] CHECK ([dat_ksieg] IS NULL OR [dat_ksieg]>='17530101' AND [dat_ksieg]<='99991231'),
    CONSTRAINT [CKC_DAT_WYSTAW_DOK_DOKUMENT] CHECK ([dat_wystaw_dok]>='17530101' AND [dat_wystaw_dok]<='99991231'),
    CONSTRAINT [CKC_DAT_ZAMKN_DOKUMENT] CHECK ([dat_zamkn] IS NULL OR [dat_zamkn]>='17530101' AND [dat_zamkn]<='99991231')
);


GO
CREATE NONCLUSTERED INDEX [IX_dokumenty_dat_wystaw_dok]
    ON [zef].[dokumenty]([dat_wystaw_dok] ASC)
    ON [FG_ZEF];


GO
CREATE NONCLUSTERED INDEX [IX_dokumenty_sym_dok]
    ON [zef].[dokumenty]([sym_dok] ASC)
    ON [FG_ZEF];

