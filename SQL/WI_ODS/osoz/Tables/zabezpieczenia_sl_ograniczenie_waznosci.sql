CREATE TABLE [osoz].[zabezpieczenia_sl_ograniczenie_waznosci] (
    [zabezpieczenie_id]           BIGINT NOT NULL,
    [sl_ograniczenie_waznosci_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [sl_ograniczenie_waznosci_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk687f296e12fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk687f296ef5ede0fe] FOREIGN KEY ([sl_ograniczenie_waznosci_id]) REFERENCES [osoz].[sl_ograniczenie_waznosci] ([id])
);

