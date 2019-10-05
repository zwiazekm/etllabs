CREATE TABLE [pdr].[c160] (
    [c160_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [email]                VARCHAR (70)   NULL,
    [fax]                  VARCHAR (40)   NULL,
    [kod]                  VARCHAR (17)   NOT NULL,
    [kod_pocztowy]         VARCHAR (9)    NOT NULL,
    [kraj]                 VARCHAR (2)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [miejscowosc]          NVARCHAR (35)  NOT NULL,
    [nazwa_krotka]         NVARCHAR (35)  NOT NULL,
    [nazwa_pelna]          NVARCHAR (255) NOT NULL,
    [poczta]               NVARCHAR (35)  NULL,
    [telefon]              VARCHAR (40)   NULL,
    [ulica]                NVARCHAR (35)  NOT NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c160_id] ASC)
);

