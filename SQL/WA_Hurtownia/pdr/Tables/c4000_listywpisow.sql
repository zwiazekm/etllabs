CREATE TABLE [pdr].[c4000_listywpisow] (
    [c4000_listywpisow_id]         BIGINT       NOT NULL,
    [numerwpisu]                   NVARCHAR (7) NULL,
    [rodzajlisty]                  VARCHAR (1)  NULL,
    [c4000_daneidentyfikacyjne_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4000_listywpisow_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4000_listywpisow_c4000_daneidentyfikacyjne_id_fkey] FOREIGN KEY ([c4000_daneidentyfikacyjne_id]) REFERENCES [pdr].[c4000_daneidentyfikacyjne] ([c4000_daneidentyfikacyjne_id])
);

