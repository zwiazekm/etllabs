CREATE TABLE [pdr].[c4003_miejscawykonywaniadziala] (
    [c4003_miejscawykonywaniadziala_id] BIGINT        NOT NULL,
    [gmina]                             NVARCHAR (50) NULL,
    [kodpocztowy]                       VARCHAR (9)   NULL,
    [kraj]                              VARCHAR (2)   NULL,
    [miejscowosc]                       NVARCHAR (52) NULL,
    [numerdomu]                         NVARCHAR (10) NULL,
    [numerlokalu]                       NVARCHAR (10) NULL,
    [poczta]                            NVARCHAR (52) NULL,
    [powiat]                            NVARCHAR (50) NULL,
    [ulica]                             NVARCHAR (80) NULL,
    [wojewodztwo]                       NVARCHAR (30) NULL,
    [c4003_szczegolydzialalnosci_id]    BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4003_miejscawykonywaniadziala_id] ASC)
);

