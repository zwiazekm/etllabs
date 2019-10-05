CREATE TABLE [pdr].[c4003_epuap] (
    [c4003_epuap_id]        BIGINT         NOT NULL,
    [adresepuap]            VARCHAR (200)  NULL,
    [datado]                DATE           NULL,
    [dataod]                DATE           NULL,
    [nazwaepuap]            NVARCHAR (100) NULL,
    [c4003_daneadresowe_id] BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_epuap_id] ASC)
);

