﻿CREATE TABLE [pdr].[c4001_reprezentacje] (
    [c4001_reprezentacje_id] BIGINT        NOT NULL,
    [datado]                 VARCHAR (255) NULL,
    [dataod]                 DATE          NULL,
    [formareprezentacji]     VARCHAR (2)   NOT NULL,
    [c4001_id]               BIGINT        NULL,
    [czyterminowe]           BIT           NULL,
    PRIMARY KEY CLUSTERED ([c4001_reprezentacje_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4001_reprezentacje_c4001_id_fkey] FOREIGN KEY ([c4001_id]) REFERENCES [pdr].[c4001] ([c4001_id])
);

