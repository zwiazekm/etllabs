CREATE TABLE [osoz].[uzupelnienia_kwoty] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [data_uzupelnienia]       DATETIME        NOT NULL,
    [kwota_uzupelnienia]      NUMERIC (19, 2) NOT NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [sl_waluty_id]            BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkcfe2ce0c12fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fkcfe2ce0c4792384d] FOREIGN KEY ([forma_zabezpieczenia_id]) REFERENCES [osoz].[forma_zabezpieczenia] ([id]),
    CONSTRAINT [fkcfe2ce0cb64cdbd] FOREIGN KEY ([sl_waluty_id]) REFERENCES [osoz].[sl_waluty] ([id])
);

