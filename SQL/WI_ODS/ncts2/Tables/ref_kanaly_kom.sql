CREATE TABLE [ncts2].[ref_kanaly_kom] (
    [id]                          BIGINT         NOT NULL,
    [podmiot_id]                  BIGINT         NULL,
    [kanal]                       NVARCHAR (1)   NULL,
    [email_adres]                 NVARCHAR (70)  NULL,
    [epuap_podmiot_id]            NVARCHAR (128) NULL,
    [epuap_skrytka_id]            NVARCHAR (128) NULL,
    [ws_do_podmiotu_url]          NVARCHAR (400) NULL,
    [ws_do_podmiotu_login]        NVARCHAR (100) NULL,
    [ws_do_podmiotu_haslo]        NVARCHAR (255) NULL,
    [ws_do_podmiotu_odcisk_palca] NVARCHAR (250) NULL,
    [domyslny]                    BIT            NULL,
    [data_od]                     DATETIME       NULL,
    [data_do]                     DATETIME       NULL,
    [seap_id]                     NVARCHAR (400) NULL,
    CONSTRAINT [ref_kanaly_kom_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_kanaly_kom_podmiot_id_id_fk] FOREIGN KEY ([podmiot_id]) REFERENCES [ncts2].[ref_podmioty] ([id])
);

