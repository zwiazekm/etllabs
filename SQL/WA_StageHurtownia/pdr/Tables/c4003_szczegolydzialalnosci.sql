CREATE TABLE [pdr].[c4003_szczegolydzialalnosci] (
    [c4003_szczegolydzialalnosci_id] BIGINT      NOT NULL,
    [rodzajwyrobu]                   VARCHAR (2) NULL,
    [sredniailosc]                   BIGINT      NULL,
    [c4003_akcyza_id]                BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4003_szczegolydzialalnosci_id] ASC)
);

