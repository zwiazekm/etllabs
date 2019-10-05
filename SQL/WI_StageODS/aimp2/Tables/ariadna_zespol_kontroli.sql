CREATE TABLE [aimp2].[ariadna_zespol_kontroli] (
    [id]                          NUMERIC (19)   NOT NULL,
    [obsluga_wskazan_kontroli_id] NUMERIC (19)   NOT NULL,
    [login]                       NVARCHAR (600) NULL,
    [rejestrator_wynikow_ZISAR]   BIT            NOT NULL,
    CONSTRAINT [ariadna_zespol_kontroli$ariadna_ze_3471452511] PRIMARY KEY CLUSTERED ([id] ASC)
);

