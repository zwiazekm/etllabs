CREATE TABLE [pdr].[c4003_kodynace] (
    [c4003_kodynace_id]            BIGINT       NOT NULL,
    [nace]                         NVARCHAR (5) NULL,
    [c4003_daneidentyfikacyjne_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4003_kodynace_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_kodynace_c4003_daneidentyfikacyjne_id_fkey] FOREIGN KEY ([c4003_daneidentyfikacyjne_id]) REFERENCES [pdr].[c4003_daneidentyfikacyjne] ([c4003_daneidentyfikacyjne_id])
);

