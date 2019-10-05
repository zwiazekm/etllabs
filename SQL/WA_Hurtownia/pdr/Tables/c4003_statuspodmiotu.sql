CREATE TABLE [pdr].[c4003_statuspodmiotu] (
    [c4003_statuspodmiotu_id] BIGINT      NOT NULL,
    [datado]                  DATE        NULL,
    [dataod]                  DATE        NULL,
    [status]                  VARCHAR (1) NULL,
    [c4003_id]                BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4003_statuspodmiotu_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_statuspodmiotu_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

