CREATE TABLE [ncts2].[safe_tir_rejestracje_awaryjne] (
    [id]                       BIGINT          NOT NULL,
    [numer_karnetu_tir]        NVARCHAR (10)   NULL,
    [mrn]                      NVARCHAR (18)   NULL,
    [kod_uc]                   NVARCHAR (8)    NULL,
    [status]                   NVARCHAR (20)   NULL,
    [data_kontroli]            DATETIME        NULL,
    [numer_strony_karnetu_tir] NVARCHAR (2)    NULL,
    [typ_rozladunku]           NVARCHAR (1)    NULL,
    [numer_rozladunku]         NVARCHAR (2)    NULL,
    [zwolnienie_zastrzezenia]  BIT             NULL,
    [id_komunkatu_utworzenia]  NVARCHAR (1024) NULL,
    [id_komunikatu_usuniecia]  NVARCHAR (1024) NULL,
    [anr]                      NVARCHAR (16)   NULL,
    [status_data]              DATETIME        NULL,
    [kod_bledu]                INT             NULL,
    [uzytkownik_id]            BIGINT          NULL,
    CONSTRAINT [safe_tir_rejestracje_awaryjne_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

