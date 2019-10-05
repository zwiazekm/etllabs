CREATE TABLE [pdr].[c4000_epuap] (
    [c4000_epuap_id]        BIGINT         NOT NULL,
    [adresepuap]            VARCHAR (200)  NULL,
    [datado]                DATE           NULL,
    [dataod]                DATE           NULL,
    [nazwaepuap]            NVARCHAR (100) NULL,
    [c4000_daneadresowe_id] BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4000_epuap_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4000_epuap_c4000_daneadresowe_id_fkey] FOREIGN KEY ([c4000_daneadresowe_id]) REFERENCES [pdr].[c4000_daneadresowe] ([c4000_daneadresowe_id])
);

