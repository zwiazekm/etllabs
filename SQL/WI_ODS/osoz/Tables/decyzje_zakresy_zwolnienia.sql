CREATE TABLE [osoz].[decyzje_zakresy_zwolnienia] (
    [decyzja_w_sprawie_zwolnienia_id] BIGINT        NOT NULL,
    [zakres_zwolnienia]               VARCHAR (255) NULL,
    CONSTRAINT [fkb6f47e99dab2c177] FOREIGN KEY ([decyzja_w_sprawie_zwolnienia_id]) REFERENCES [osoz].[decyzje_w_sprawie_zwolnienia] ([id])
) ON [FG_OSOZ];

