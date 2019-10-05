CREATE TABLE [pdr].[c4001_pelnomocnictwoinne] (
    [c4001_pelnomocnictwoinne_id]  BIGINT NOT NULL,
    [opis]                         TEXT   NULL,
    [pelnomocnictwoszczegolneinne] BIT    NULL,
    [c4001_postepowanie_id]        BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4001_pelnomocnictwoinne_id] ASC)
);

