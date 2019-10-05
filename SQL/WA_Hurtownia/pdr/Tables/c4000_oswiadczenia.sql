CREATE TABLE [pdr].[c4000_oswiadczenia] (
    [c4000_oswiadczenia_id]    BIGINT NOT NULL,
    [komunikacjaelektroniczna] BIT    NULL,
    [prawdziwoscdanych]        BIT    NOT NULL,
    [zapoznaniezinstrukcja]    BIT    NULL,
    [c4000_id]                 BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4000_oswiadczenia_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4000_oswiadczenia_c4000_id_fkey] FOREIGN KEY ([c4000_id]) REFERENCES [pdr].[c4000] ([c4000_id])
);

