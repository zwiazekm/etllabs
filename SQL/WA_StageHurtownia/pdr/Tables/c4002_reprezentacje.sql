CREATE TABLE [pdr].[c4002_reprezentacje] (
    [c4002_reprezentacje_id] BIGINT        NOT NULL,
    [datado]                 VARCHAR (255) NULL,
    [dataod]                 DATE          NULL,
    [formareprezentacji]     VARCHAR (2)   NOT NULL,
    [c4002_id]               BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4002_reprezentacje_id] ASC)
);

