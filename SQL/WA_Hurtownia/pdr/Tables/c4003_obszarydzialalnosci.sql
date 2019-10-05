CREATE TABLE [pdr].[c4003_obszarydzialalnosci] (
    [c4003_obszarydzialalnosci_id] BIGINT      NOT NULL,
    [obszardzialalnosci]           VARCHAR (1) NULL,
    [c4003_id]                     BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4003_obszarydzialalnosci_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_obszarydzialalnosci_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

