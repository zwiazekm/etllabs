CREATE TABLE [pdr].[c4003_daneadresowe] (
    [c4003_daneadresowe_id] BIGINT        NOT NULL,
    [email]                 VARCHAR (70)  NULL,
    [faks]                  VARCHAR (35)  NULL,
    [gmina]                 NVARCHAR (50) NULL,
    [kodpocztowy]           VARCHAR (9)   NULL,
    [kraj]                  CHAR (2)      NOT NULL,
    [miejscowosc]           NVARCHAR (52) NOT NULL,
    [numerdomu]             NVARCHAR (10) NULL,
    [numerlokalu]           NVARCHAR (10) NULL,
    [poczta]                NVARCHAR (52) NULL,
    [powiat]                NVARCHAR (50) NULL,
    [rodzajadresu]          CHAR (2)      NOT NULL,
    [skrytkapocztowa]       VARCHAR (10)  NULL,
    [telefon]               VARCHAR (35)  NULL,
    [ulica]                 NVARCHAR (80) NULL,
    [wojewodztwo]           NVARCHAR (30) NULL,
    [c4003_id]              BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4003_daneadresowe_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_daneadresowe_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

