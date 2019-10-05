CREATE TABLE [pdr].[c4003_oswiadczenia] (
    [c4003_oswiadczenia_id]      BIGINT NOT NULL,
    [komunikacjaelektroniczna]   BIT    NULL,
    [prawdziwoscdanych]          BIT    NULL,
    [publikacjake]               BIT    NULL,
    [c4003_id]                   BIGINT NULL,
    [instrukcjeezgloszencelnych] BIT    NULL,
    PRIMARY KEY CLUSTERED ([c4003_oswiadczenia_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_oswiadczenia_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

