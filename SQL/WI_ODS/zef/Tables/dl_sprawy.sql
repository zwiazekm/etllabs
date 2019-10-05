CREATE TABLE [zef].[dl_sprawy] (
    [id_dok_sprawy] VARCHAR (30)  NOT NULL,
    [id_uc]         CHAR (6)      NULL,
    [id_rodz_dok]   CHAR (4)      NULL,
    [symbol_dok]    VARCHAR (30)  NULL,
    [id_komor]      VARCHAR (20)  NULL,
    [id_kontr]      NUMERIC (10)  NULL,
    [status_spr]    CHAR (1)      NULL,
    [data_dok]      DATETIME      NULL,
    [data_powst]    DATETIME      NULL,
    [data_wyzer]    DATETIME      NULL,
    [przycz_zadl]   VARCHAR (6)   NULL,
    [uwagi]         VARCHAR (255) NULL,
    [data_ksieg]    DATETIME      NULL,
    [replika]       VARCHAR (1)   NULL,
    [opis]          VARCHAR (80)  NULL,
    [odsetka]       CHAR (1)      DEFAULT ('0') NULL,
    CONSTRAINT [PK_DL_SPRAWY] PRIMARY KEY CLUSTERED ([id_dok_sprawy] ASC) ON [FG_ZEF]
);

