CREATE TABLE [pdr].[c227] (
    [c227_id]              INT            NOT NULL,
    [aktywny]              BIT            NOT NULL,
    [certyfikat]           TEXT           NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [id_old_pdr]           VARCHAR (20)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [thumbprint]           VARCHAR (80)   NOT NULL,
    [uc_oswiadczenia]      VARCHAR (8)    NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NOT NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    [wlasciciel]           NVARCHAR (255) NOT NULL,
    [wystawca]             NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([c227_id] ASC) ON [FG_PDR]
) TEXTIMAGE_ON [FG_PDR];

