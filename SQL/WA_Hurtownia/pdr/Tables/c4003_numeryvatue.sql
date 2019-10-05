CREATE TABLE [pdr].[c4003_numeryvatue] (
    [c4003_numeryvatue_id]         BIGINT        NOT NULL,
    [numervatue]                   NVARCHAR (17) NULL,
    [c4003_daneidentyfikacyjne_id] BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4003_numeryvatue_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_numeryvatue_c4003_daneidentyfikacyjne_id_fkey] FOREIGN KEY ([c4003_daneidentyfikacyjne_id]) REFERENCES [pdr].[c4003_daneidentyfikacyjne] ([c4003_daneidentyfikacyjne_id])
);

