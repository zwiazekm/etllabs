CREATE TABLE [pdr].[c4003_oddzialy] (
    [c4003_oddzialy_id] BIGINT         NOT NULL,
    [nazwaoddzialu]     NVARCHAR (300) NOT NULL,
    [regonoddzialu]     VARCHAR (14)   NULL,
    [c4003_id]          BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_oddzialy_id] ASC)
);

