CREATE TABLE [zef].[psad] (
    [id_dok]     VARCHAR (30)    NOT NULL,
    [nr_poz]     SMALLINT        NOT NULL,
    [rodz_nal]   CHAR (6)        NULL,
    [kwota_nal]  NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [term_plat]  DATETIME        NULL,
    [form_plat]  CHAR (6)        NULL,
    [id_jedn]    VARCHAR (20)    NULL,
    [zwolnienie] CHAR (1)        DEFAULT ('N') NULL,
    [kwota_zab]  NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [grupa]      SMALLINT        NULL,
    [odroczenie] CHAR (1)        DEFAULT ('N') NULL,
    CONSTRAINT [PK_PSAD] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC)
);

