CREATE TABLE [ncts2].[ostrzezenia_systemy_zewnetrzne] (
    [id]                     BIGINT         NOT NULL,
    [operacja_tranzytowa_id] BIGINT         NULL,
    [zrodlo]                 NVARCHAR (8)   NULL,
    [opis]                   NVARCHAR (250) NULL,
    [typ_uc]                 NVARCHAR (1)   NULL,
    CONSTRAINT [ostrzezenia_systemy_zewnetrzne_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

