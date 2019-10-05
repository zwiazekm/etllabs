CREATE TABLE [pdr].[c4000_dokumenttozsamosci] (
    [c4000_dokumenttozsamosci_id]  BIGINT       NOT NULL,
    [rodzajdokumentutozsamosci]    VARCHAR (2)  NULL,
    [seriainumer]                  VARCHAR (40) NULL,
    [c4000_daneidentyfikacyjne_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4000_dokumenttozsamosci_id] ASC)
);

