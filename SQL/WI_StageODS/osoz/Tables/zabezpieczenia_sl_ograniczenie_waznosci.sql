CREATE TABLE [osoz].[zabezpieczenia_sl_ograniczenie_waznosci] (
    [zabezpieczenie_id]           BIGINT NOT NULL,
    [sl_ograniczenie_waznosci_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [sl_ograniczenie_waznosci_id] ASC)
);

