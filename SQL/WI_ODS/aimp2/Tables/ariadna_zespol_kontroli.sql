CREATE TABLE [aimp2].[ariadna_zespol_kontroli] (
    [id]                          NUMERIC (19)   NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19)   NOT NULL,
    [login]                       NVARCHAR (600) NULL,
    [rejestrator_wynikow_ZISAR]   BIT            NOT NULL,
    CONSTRAINT [ariadna_zespol_kontroli_PK] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIMP2],
    CONSTRAINT [ariadna_zespol_kontroli$ariadna_ze_1431113258] FOREIGN KEY ([obsluga_wskazan_kontroli_id]) REFERENCES [aimp2].[ariadna_owk] ([id])
);

