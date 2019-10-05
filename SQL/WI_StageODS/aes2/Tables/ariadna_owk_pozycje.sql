CREATE TABLE [aes2].[ariadna_owk_pozycje] (
    [id]                          NUMERIC (19) NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19) NOT NULL,
    [nr_pozycji]                  INT          NULL,
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_pozycje$ariadna_ob_14706252511] PRIMARY KEY CLUSTERED ([id] ASC)
);

