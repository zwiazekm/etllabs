CREATE TABLE [pdr].[c4003_daneadresoweoddzialu] (
    [c4003_daneadresoweoddzialu_id] BIGINT        NOT NULL,
    [email]                         VARCHAR (70)  NULL,
    [faks]                          VARCHAR (35)  NULL,
    [gmina]                         NVARCHAR (50) NULL,
    [kodpocztowy]                   VARCHAR (9)   NULL,
    [kraj]                          VARCHAR (2)   NULL,
    [miejscowosc]                   NVARCHAR (52) NULL,
    [numerdomu]                     NVARCHAR (10) NULL,
    [numerlokalu]                   NVARCHAR (10) NULL,
    [poczta]                        NVARCHAR (52) NULL,
    [powiat]                        NVARCHAR (50) NULL,
    [rodzajadresu]                  CHAR (2)      NULL,
    [skrytkapocztowa]               VARCHAR (10)  NULL,
    [telefon]                       VARCHAR (35)  NULL,
    [ulica]                         NVARCHAR (80) NULL,
    [waznydo]                       DATE          NULL,
    [waznyod]                       DATE          NULL,
    [wojewodztwo]                   NVARCHAR (30) NULL,
    [c4003_oddzialy_id]             BIGINT        NULL,
    CONSTRAINT [PK__c4003_da__878541FFB07B741B] PRIMARY KEY CLUSTERED ([c4003_daneadresoweoddzialu_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_daneadresoweoddzialu_c4003_oddzialy_id_fkey] FOREIGN KEY ([c4003_oddzialy_id]) REFERENCES [pdr].[c4003_oddzialy] ([c4003_oddzialy_id])
);

