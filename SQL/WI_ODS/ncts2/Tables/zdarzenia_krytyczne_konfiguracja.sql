CREATE TABLE [ncts2].[zdarzenia_krytyczne_konfiguracja] (
    [id]                         BIGINT        NOT NULL,
    [uzytkownik_id]              BIGINT        NULL,
    [etykieta]                   NVARCHAR (50) NULL,
    [czy_aktywne]                BIT           NULL,
    [wazne_do]                   DATETIME      NULL,
    [procedura_uproszczona]      BIT           NULL,
    [tin_nadawcy]                NVARCHAR (17) NULL,
    [tin_odbiorcy]               NVARCHAR (17) NULL,
    [tin_glownego_zobowiazanego] NVARCHAR (17) NULL,
    [numer_karnetu_tir]          NVARCHAR (10) NULL,
    CONSTRAINT [zdarzenia_krytyczne_konfiguracja_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

