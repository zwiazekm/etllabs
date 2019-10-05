CREATE TABLE [osoz].[zabezpieczenia_procedury_akcyzowe] (
    [zabezpieczenie_id]     BIGINT NOT NULL,
    [procedura_akcyzowa_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [procedura_akcyzowa_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk1431d08612fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk1431d086a423fb11] FOREIGN KEY ([procedura_akcyzowa_id]) REFERENCES [osoz].[procedury_akcyzowe] ([id])
);

