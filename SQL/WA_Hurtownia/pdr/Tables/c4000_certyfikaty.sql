CREATE TABLE [pdr].[c4000_certyfikaty] (
    [c4000_certyfikaty_id]         BIGINT NOT NULL,
    [datado]                       DATE   NULL,
    [dataod]                       DATE   NULL,
    [numercertyfikatu]             TEXT   NULL,
    [odciskpalcacertyfikatu]       TEXT   NULL,
    [c4000_daneidentyfikacyjne_id] BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4000_certyfikaty_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4000_certyfikaty_c4000_daneidentyfikacyjne_id_fkey] FOREIGN KEY ([c4000_daneidentyfikacyjne_id]) REFERENCES [pdr].[c4000_daneidentyfikacyjne] ([c4000_daneidentyfikacyjne_id])
) TEXTIMAGE_ON [FG_PDR];

