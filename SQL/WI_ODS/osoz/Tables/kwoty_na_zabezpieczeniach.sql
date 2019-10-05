CREATE TABLE [osoz].[kwoty_na_zabezpieczeniach] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [kwota_na_zabezpieczeniu] NUMERIC (19, 2) NOT NULL,
    [pokwitowanie_id]         BIGINT          NOT NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkee4ece12fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fkee4ececac4ee22] FOREIGN KEY ([pokwitowanie_id]) REFERENCES [osoz].[pokwitowania] ([id])
);

