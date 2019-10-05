CREATE TABLE [pdr].[c4001_postepowanie] (
    [c4001_postepowanie_id]  BIGINT NOT NULL,
    [pelnomocnictwoogolne]   BIT    NULL,
    [c4001_reprezentacje_id] BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4001_postepowanie_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4001_postepowanie_c4001_reprezentacje_id_fkey] FOREIGN KEY ([c4001_reprezentacje_id]) REFERENCES [pdr].[c4001_reprezentacje] ([c4001_reprezentacje_id])
);

