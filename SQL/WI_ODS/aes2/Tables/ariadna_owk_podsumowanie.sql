CREATE TABLE [aes2].[ariadna_owk_podsumowanie] (
    [id]                          NUMERIC (19)   NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19)   NOT NULL,
    [nr_pozycji]                  INT            NULL,
    [zakres_przebieg_kontroli_SO] NVARCHAR (600) NULL,
    [wynik_kontroli_SO]           NVARCHAR (108) NULL,
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_podsumowanie$ariadna_ob_21106275311] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_podsumowanie$ariadna_ob_1383113087] FOREIGN KEY ([obsluga_wskazan_kontroli_id]) REFERENCES [aes2].[ariadna_owk] ([id])
);

