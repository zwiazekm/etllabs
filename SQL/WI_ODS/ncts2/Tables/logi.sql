CREATE TABLE [ncts2].[logi] (
    [id]                     BIGINT          NOT NULL,
    [czas]                   DATETIME        NULL,
    [poziom]                 NVARCHAR (8)    NULL,
    [kod_uc]                 NVARCHAR (8)    NULL,
    [typ_uc]                 NVARCHAR (1)    NULL,
    [blad_id]                NVARCHAR (32)   NULL,
    [komunikat_id]           BIGINT          NULL,
    [operacja_tranzytowa_id] BIGINT          NULL,
    [status]                 NVARCHAR (16)   NULL,
    [proces_biznesowy]       NVARCHAR (16)   NULL,
    [operacja]               NVARCHAR (40)   NULL,
    [uwagi]                  NVARCHAR (1200) NULL,
    [login]                  NVARCHAR (128)  NULL,
    [uzytkownik_id]          BIGINT          NULL,
    [rola_id]                BIGINT          NULL,
    [adres_ip]               NVARCHAR (15)   NULL,
    [nazwa_hosta]            NVARCHAR (100)  NULL,
    [nazwa_procesu]          NVARCHAR (50)   NULL,
    [pid]                    INT             NULL,
    [watek_id]               INT             NULL,
    CONSTRAINT [logi_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

