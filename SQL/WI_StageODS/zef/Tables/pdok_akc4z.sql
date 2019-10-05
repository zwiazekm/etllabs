CREATE TABLE [zef].[pdok_akc4z] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [zalacznik]      CHAR (2)        NOT NULL,
    [nr_zal]         INT             NOT NULL,
    [nr_poz]         INT             NOT NULL,
    [nr_poz_slow]    NUMERIC (10)    NULL,
    [nazwa_grp]      VARCHAR (255)   NULL,
    [rodz_sym]       CHAR (1)        NULL,
    [rodz_st]        CHAR (1)        NULL,
    [symbol]         VARCHAR (15)    NULL,
    [podst_pod]      DECIMAL (20, 3) NULL,
    [podst_pod_proc] DECIMAL (20, 2) NULL,
    [staw_pod]       DECIMAL (20, 2) NULL,
    [staw_pod_proc]  DECIMAL (20, 2) NULL,
    [kwota_pod]      DECIMAL (20, 3) NULL,
    [tytul]          VARCHAR (10)    NULL,
    [nr_poz_ewid]    SMALLINT        NULL,
    [podst_obn]      DECIMAL (20, 3) NULL,
    [staw_obn]       DECIMAL (20, 3) NULL,
    [kwota_obn]      DECIMAL (20, 3) NULL,
    CONSTRAINT [PK_PDOK_AKC4Z] PRIMARY KEY CLUSTERED ([id_dok] ASC, [zalacznik] ASC, [nr_zal] ASC, [nr_poz] ASC)
);

