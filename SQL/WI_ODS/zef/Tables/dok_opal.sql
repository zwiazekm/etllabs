CREATE TABLE [zef].[dok_opal] (
    [id_dok]         VARCHAR (30) NOT NULL,
    [plat_id_komor]  VARCHAR (20) NULL,
    [plat_id_kontr]  NUMERIC (10) NULL,
    [nr_dok_spraw]   VARCHAR (30) NULL,
    [rodz_nal]       CHAR (6)     NULL,
    [form_plat]      CHAR (6)     NULL,
    [term_plat]      DATETIME     NULL,
    [nr_wyk_szczeg]  VARCHAR (30) NULL,
    [poz_wyk_szczeg] INT          NULL,
    [typ]            CHAR (1)     NULL,
    [id_jedn]        VARCHAR (20) NULL,
    [okres]          DATETIME     NULL,
    [dat_wypel]      DATETIME     NULL,
    [dat_wplywu]     DATETIME     NULL,
    [id_komor]       VARCHAR (20) NULL,
    [id_kontr]       NUMERIC (10) NULL,
    CONSTRAINT [PK_DOK_OPAL] PRIMARY KEY CLUSTERED ([id_dok] ASC) ON [FG_ZEF],
    CONSTRAINT [CKC_TERM_PLAT_DOK_OPAL] CHECK ([term_plat] IS NULL OR [term_plat]>='17530101' AND [term_plat]<='99991231')
);

