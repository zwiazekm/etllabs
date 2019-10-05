CREATE TABLE [pdr].[c4000_listywpisow] (
    [c4000_listywpisow_id]         BIGINT       NOT NULL,
    [numerwpisu]                   NVARCHAR (7) NULL,
    [rodzajlisty]                  VARCHAR (1)  NULL,
    [c4000_daneidentyfikacyjne_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4000_listywpisow_id] ASC)
);

