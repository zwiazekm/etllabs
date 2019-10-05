CREATE TABLE [pdr].[c4002_reprezentacje] (
    [c4002_reprezentacje_id] BIGINT        NOT NULL,
    [datado]                 VARCHAR (255) NULL,
    [dataod]                 DATE          NULL,
    [formareprezentacji]     VARCHAR (2)   NOT NULL,
    [c4002_id]               BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4002_reprezentacje_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4002_reprezentacje_c4002_id_fkey] FOREIGN KEY ([c4002_id]) REFERENCES [pdr].[c4002] ([c4002_id])
);

