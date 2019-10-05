CREATE TABLE [pdr].[c4003_kontabankowe] (
    [c4003_kontabankowe_id] BIGINT         NOT NULL,
    [iban]                  VARCHAR (2)    NULL,
    [nazwabanku]            NVARCHAR (80)  NULL,
    [numerkontabankowego]   NVARCHAR (50)  NULL,
    [oddzialbanku]          NVARCHAR (255) NULL,
    [rodzajkonta]           VARCHAR (1)    NULL,
    [swiftbanku]            VARCHAR (11)   NULL,
    [typkonta]              VARCHAR (1)    NULL,
    [c4003_id]              BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_kontabankowe_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_kontabankowe_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

