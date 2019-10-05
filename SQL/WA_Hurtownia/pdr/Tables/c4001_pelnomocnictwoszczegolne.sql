CREATE TABLE [pdr].[c4001_pelnomocnictwoszczegolne] (
    [c4001_pelnomocnictwoszczegolne_id] BIGINT         NOT NULL,
    [organ]                             NVARCHAR (255) NULL,
    [wlasciwoscmiejscowa]               NVARCHAR (8)   NULL,
    [zakresrzeczowy]                    VARCHAR (2)    NULL,
    [c4001_postepowanie_id]             BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4001_pelnomocnictwoszczegolne_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4001_pelnomocnictwoszczegolne_c4001_postepowanie_id_fkey] FOREIGN KEY ([c4001_postepowanie_id]) REFERENCES [pdr].[c4001_postepowanie] ([c4001_postepowanie_id])
);

