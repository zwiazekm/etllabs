CREATE TABLE [pdr].[c4000_statusosoby] (
    [c4000_statusosoby_id]   BIGINT      NOT NULL,
    [datado]                 DATE        NULL,
    [dataod]                 DATE        NULL,
    [rejestracjauproszczona] BIT         NULL,
    [status]                 VARCHAR (1) NOT NULL,
    [c4000_id]               BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4000_statusosoby_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4000_statusosoby_c4000_id_fkey] FOREIGN KEY ([c4000_id]) REFERENCES [pdr].[c4000] ([c4000_id])
);

