CREATE TABLE [ncts2].[uc_tranzytowe] (
    [operacja_tranzytowa_id]    BIGINT       NULL,
    [uc_tranzytowy]             NVARCHAR (8) NULL,
    [czas_przybycia]            DATETIME     NULL,
    [id]                        BIGINT       NOT NULL,
    [poz_id]                    INT          NULL,
    [status_uc_tranzytowy]      NVARCHAR (8) NULL,
    [status_uc_tranzytowy_data] DATETIME     NULL,
    [ryzyko_uc_tranzytowy]      INT          NULL,
    [flaga_ar_uc_tranzytowy]    NVARCHAR (1) NULL,
    CONSTRAINT [uc_tranzytowe_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

