CREATE TABLE [pdr].[c4003_oddzialy] (
    [c4003_oddzialy_id] BIGINT         NOT NULL,
    [nazwaoddzialu]     NVARCHAR (300) NOT NULL,
    [regonoddzialu]     VARCHAR (14)   NULL,
    [c4003_id]          BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_oddzialy_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_oddzialy_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

