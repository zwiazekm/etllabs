CREATE TABLE [pdr].[c4003_akcyza] (
    [c4003_akcyza_id] BIGINT NOT NULL,
    [c4003_id]        BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4003_akcyza_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_akcyza_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

