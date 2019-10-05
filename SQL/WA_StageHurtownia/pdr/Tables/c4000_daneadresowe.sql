CREATE TABLE [pdr].[c4000_daneadresowe] (
    [c4000_daneadresowe_id] BIGINT        NOT NULL,
    [email]                 VARCHAR (70)  NOT NULL,
    [faks]                  VARCHAR (35)  NULL,
    [gmina]                 NVARCHAR (50) NULL,
    [kodpocztowy]           VARCHAR (9)   NULL,
    [kraj]                  VARCHAR (2)   NOT NULL,
    [miejscowosc]           NVARCHAR (52) NOT NULL,
    [numerdomu]             NVARCHAR (10) NOT NULL,
    [numerlokalu]           NVARCHAR (10) NULL,
    [poczta]                NVARCHAR (50) NULL,
    [powiat]                NVARCHAR (50) NULL,
    [rodzajadresu]          VARCHAR (2)   NULL,
    [skrytkapocztowa]       VARCHAR (10)  NULL,
    [telefon]               VARCHAR (35)  NOT NULL,
    [ulica]                 NVARCHAR (80) NULL,
    [wojewodztwo]           NVARCHAR (30) NULL,
    [c4000_id]              BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4000_daneadresowe_id] ASC)
);

