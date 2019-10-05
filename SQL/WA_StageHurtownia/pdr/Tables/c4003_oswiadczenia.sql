CREATE TABLE [pdr].[c4003_oswiadczenia] (
    [c4003_oswiadczenia_id]      BIGINT NOT NULL,
    [komunikacjaelektroniczna]   BIT    NULL,
    [prawdziwoscdanych]          BIT    NULL,
    [publikacjake]               BIT    NULL,
    [c4003_id]                   BIGINT NULL,
    [instrukcjeezgloszencelnych] BIT    NULL,
    PRIMARY KEY CLUSTERED ([c4003_oswiadczenia_id] ASC)
);

