CREATE TABLE [osoz].[zabezpieczenia_generalne_procedury_procedury] (
    [zabezpieczenia_generalne_procedury_id] BIGINT NOT NULL,
    [procedury_id]                          BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenia_generalne_procedury_id] ASC, [procedury_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkb296978474fd86a6] FOREIGN KEY ([zabezpieczenia_generalne_procedury_id]) REFERENCES [osoz].[zabezpieczenia_generalne_procedury] ([id]),
    CONSTRAINT [fkb2969784deaeb729] FOREIGN KEY ([procedury_id]) REFERENCES [osoz].[procedury_celne] ([id])
);

