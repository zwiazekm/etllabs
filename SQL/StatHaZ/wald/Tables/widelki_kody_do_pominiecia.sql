CREATE TABLE [wald].[widelki_kody_do_pominiecia] (
    [kod_cn]  VARCHAR (8)   NULL,
    [opis_cn] VARCHAR (255) NULL,
    CONSTRAINT [IX_widelki_kody_do_pominiecia] UNIQUE CLUSTERED ([kod_cn] ASC) ON [WaldDane]
);

