CREATE TABLE [int].[istat_dok_zrodlowy] (
    [id_dok_zrd]        VARCHAR (30)  NOT NULL,
    [sym_dok_zrd]       VARCHAR (40)  NULL,
    [rodz_dok_zrd]      VARCHAR (4)   NULL,
    [sposob_wpr_zrd]    CHAR (1)      NULL,
    [data_wpr_zrd]      DATETIME      NULL,
    [wprowadzil]        VARCHAR (40)  NULL,
    [xml]               TEXT          NULL,
    [id_dok_dekl_wynik] VARCHAR (30)  NULL,
    [email]             VARCHAR (128) NULL,
    [id_pliku]          VARCHAR (100) NULL,
    [err_xml]           TEXT          NULL,
    [id_jedn]           VARCHAR (20)  NULL,
    [regon]             VARCHAR (14)  NULL,
    [czy_potw]          CHAR (1)      NULL,
    CONSTRAINT [PK_ISTAT_DOK_ZRODLOWY] PRIMARY KEY CLUSTERED ([id_dok_zrd] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
) TEXTIMAGE_ON [FG_INT];

