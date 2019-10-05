CREATE TABLE [zef].[popal] (
    [id_dok]      VARCHAR (30)    NOT NULL,
    [nr_poz]      SMALLINT        NOT NULL,
    [grupa]       VARCHAR (6)     NULL,
    [symbol]      VARCHAR (20)    NULL,
    [ilosc_litr]  NUMERIC (20, 4) DEFAULT ((0)) NULL,
    [ilosc_tona]  NUMERIC (20, 4) DEFAULT ((0)) NULL,
    [cena]        NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [wartosc]     NUMERIC (20, 1) DEFAULT ((0)) NULL,
    [id_jedn]     VARCHAR (20)    NULL,
    [rodz_nal]    VARCHAR (6)     NULL,
    [nazwa]       VARCHAR (255)   NULL,
    [nr_poz_slow] NUMERIC (10)    NULL,
    [rodz_st]     CHAR (1)        NULL,
    CONSTRAINT [PK_POPAL] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC)
);

