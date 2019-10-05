CREATE TABLE [aes2].[ariadna_owk_pozycje] (
    [id]                          NUMERIC (19) NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19) NOT NULL,
    [nr_pozycji]                  INT          NULL,
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_pozycje$ariadna_ob_14706252511] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_pozycje$ariadna_ob_1335112916] FOREIGN KEY ([obsluga_wskazan_kontroli_id]) REFERENCES [aes2].[ariadna_owk] ([id])
);

