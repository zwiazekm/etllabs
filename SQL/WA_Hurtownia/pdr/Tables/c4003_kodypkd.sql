CREATE TABLE [pdr].[c4003_kodypkd] (
    [c4003_kodypkd_id]             BIGINT      NOT NULL,
    [pkd]                          VARCHAR (5) NULL,
    [c4003_daneidentyfikacyjne_id] BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4003_kodypkd_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_kodypkd_c4003_daneidentyfikacyjne_id_fkey] FOREIGN KEY ([c4003_daneidentyfikacyjne_id]) REFERENCES [pdr].[c4003_daneidentyfikacyjne] ([c4003_daneidentyfikacyjne_id])
);

