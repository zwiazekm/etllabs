CREATE TABLE [pdr].[c4001_pelnomocnictwoinne] (
    [c4001_pelnomocnictwoinne_id]  BIGINT NOT NULL,
    [opis]                         TEXT   NULL,
    [pelnomocnictwoszczegolneinne] BIT    NULL,
    [c4001_postepowanie_id]        BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4001_pelnomocnictwoinne_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4001_pelnomocnictwoinne_c4001_postepowanie_id_fkey] FOREIGN KEY ([c4001_postepowanie_id]) REFERENCES [pdr].[c4001_postepowanie] ([c4001_postepowanie_id])
) TEXTIMAGE_ON [FG_PDR];

