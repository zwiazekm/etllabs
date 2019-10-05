CREATE TABLE [pdr].[c4003_zakresdzialalnosci] (
    [c4003_zakresdzialalnosci_id]  BIGINT NOT NULL,
    [niepodlegazwolnieniuodakcyzy] BIT    NULL,
    [podlegazwolnieniuodakcyzy]    BIT    NULL,
    [c4003_akcyza_id]              BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4003_zakresdzialalnosci_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_zakresdzialalnosci_c4003_akcyza_id_fkey] FOREIGN KEY ([c4003_akcyza_id]) REFERENCES [pdr].[c4003_akcyza] ([c4003_akcyza_id])
);

