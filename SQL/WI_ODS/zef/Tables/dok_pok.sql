CREATE TABLE [zef].[dok_pok] (
    [id_dok]       VARCHAR (30)    NOT NULL,
    [okres]        DATETIME        NULL,
    [id_kontr]     NUMERIC (10)    NULL,
    [id_komor]     VARCHAR (20)    NULL,
    [p_1]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [p_2]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [p_3]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [p_4]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [p_5]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [term_plat]    DATETIME        NULL,
    [dat_wypel]    DATETIME        NULL,
    [dat_wplywu]   DATETIME        NULL,
    [nr_paczki]    VARCHAR (30)    NULL,
    [flaga]        CHAR (1)        NULL,
    [flaga_a]      CHAR (1)        NULL,
    [flaga_b]      CHAR (1)        NULL,
    [rep_id_kontr] NUMERIC (10)    NULL,
    [rep_id_komor] VARCHAR (20)    NULL,
    [tytul]        VARCHAR (10)    NULL,
    CONSTRAINT [PK_DOK_POK] PRIMARY KEY CLUSTERED ([id_dok] ASC) ON [FG_ZEF]
);

