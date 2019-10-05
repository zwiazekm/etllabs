CREATE TABLE [aimp2].[ariadna_metody_kontroli] (
    [id]                          NUMERIC (19)   NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19)   NOT NULL,
    [poziom_zdefiniowania]        NVARCHAR (108) NULL,
    [metoda_kontroli]             NVARCHAR (108) NULL,
    CONSTRAINT [ariadna_metody_kontroli_PK] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIMP2],
    CONSTRAINT [ariadna_metody_kontroli$ariadna_me_1479113429] FOREIGN KEY ([obsluga_wskazan_kontroli_id]) REFERENCES [aimp2].[ariadna_owk] ([id])
);

