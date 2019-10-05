CREATE TABLE [zef].[pdok_pok] (
    [id_dok]      VARCHAR (30)    NOT NULL,
    [nr_poz]      INT             NOT NULL,
    [nr_poz_slow] NUMERIC (10)    NULL,
    [nazwa]       VARCHAR (255)   NULL,
    [symbol]      VARCHAR (15)    NULL,
    [podst_pod]   DECIMAL (20, 3) NULL,
    [wskaznik]    DECIMAL (20, 3) NULL,
    [staw_pod]    DECIMAL (20, 2) NULL,
    [kwota_pod]   DECIMAL (20, 3) NULL,
    [tytul]       VARCHAR (10)    NULL,
    [nr_poz_ewid] SMALLINT        NULL,
    CONSTRAINT [PK_PDOK_POK] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC)
);

