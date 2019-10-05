CREATE TABLE [aimp2].[ariadna_metody_kontroli] (
    [id]                          NUMERIC (19)   NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19)   NOT NULL,
    [poziom_zdefiniowania]        NVARCHAR (108) NULL,
    [metoda_kontroli]             NVARCHAR (108) NULL,
    CONSTRAINT [ariadna_metody_kontroli$ariadna_me_9871475311] PRIMARY KEY CLUSTERED ([id] ASC)
);

