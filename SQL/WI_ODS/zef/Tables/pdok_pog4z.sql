CREATE TABLE [zef].[pdok_pog4z] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [zalacznik]      CHAR (2)        NOT NULL,
    [nr_zal]         INT             NOT NULL,
    [nr_poz]         INT             NOT NULL,
    [nr_poz_slow]    NUMERIC (10)    NULL,
    [nazwa_grp]      VARCHAR (255)   NULL,
    [rodz_sym]       CHAR (1)        NULL,
    [rodz_st]        CHAR (1)        NULL,
    [symbol]         VARCHAR (15)    NULL,
    [podst_pod]      DECIMAL (20, 3) DEFAULT ((0)) NULL,
    [podst_pod_proc] DECIMAL (20, 2) DEFAULT ((0)) NULL,
    [staw_pod]       DECIMAL (20, 2) DEFAULT ((0)) NULL,
    [staw_pod_proc]  DECIMAL (20, 2) DEFAULT ((0)) NULL,
    [kwota_pod]      DECIMAL (20, 2) DEFAULT ((0)) NULL,
    [tytul]          VARCHAR (10)    NULL,
    [nr_poz_ewid]    SMALLINT        DEFAULT ((1)) NULL,
    CONSTRAINT [PK_PDOK_POG4Z] PRIMARY KEY CLUSTERED ([id_dok] ASC, [zalacznik] ASC, [nr_zal] ASC, [nr_poz] ASC) ON [FG_ZEF]
);

