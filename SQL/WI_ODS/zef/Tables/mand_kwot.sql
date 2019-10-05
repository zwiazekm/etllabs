CREATE TABLE [zef].[mand_kwot] (
    [id_dok]   VARCHAR (30)    NOT NULL,
    [nr_poz]   SMALLINT        NOT NULL,
    [rodz_nal] CHAR (6)        NULL,
    [kwota]    NUMERIC (20, 2) NULL,
    [grupa]    SMALLINT        NULL,
    [id_jedn]  VARCHAR (20)    NULL,
    CONSTRAINT [PK_mand_kwot] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC) ON [FG_ZEF]
);

