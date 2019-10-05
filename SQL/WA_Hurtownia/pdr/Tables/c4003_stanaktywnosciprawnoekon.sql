CREATE TABLE [pdr].[c4003_stanaktywnosciprawnoekon] (
    [c4003_stanaktywnosciprawnoekon_id] BIGINT      NOT NULL,
    [ape]                               VARCHAR (2) NULL,
    [datado]                            DATE        NULL,
    [dataod]                            DATE        NULL,
    [c4003_id]                          BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4003_stanaktywnosciprawnoekon_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_stanaktywnosciprawnoekon_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

