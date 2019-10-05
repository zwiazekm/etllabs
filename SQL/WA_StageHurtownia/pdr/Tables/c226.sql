CREATE TABLE [pdr].[c226] (
    [c226_id]              INT            NOT NULL,
    [aktywny]              BIT            NOT NULL,
    [certyfikat]           TEXT           NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [rin]                  VARCHAR (17)   NOT NULL,
    [thumbprint]           VARCHAR (80)   NOT NULL,
    [uc_oswiadczenia]      VARCHAR (8)    NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NOT NULL,
    [wlasciciel]           NVARCHAR (255) NOT NULL,
    [wystawca]             NVARCHAR (255) NOT NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c226_id] ASC)
);

