CREATE TABLE [pdr].[c084] (
    [c084_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [email]                VARCHAR (70)   NULL,
    [fax]                  VARCHAR (40)   NULL,
    [kod_miejsca]          VARCHAR (17)   NOT NULL,
    [kod_pocztowy]         VARCHAR (9)    NOT NULL,
    [kraj]                 VARCHAR (2)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [miejscowosc]          NVARCHAR (35)  NOT NULL,
    [nazwa_krotka]         NVARCHAR (35)  NOT NULL,
    [nazwa_pelna]          NVARCHAR (255) NOT NULL,
    [placowka_nadrzedna]   VARCHAR (8)    NOT NULL,
    [poczta]               NVARCHAR (35)  NULL,
    [rodzaj]               VARCHAR (3)    NOT NULL,
    [telefon]              VARCHAR (40)   NULL,
    [ulica]                NVARCHAR (35)  NOT NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__c084__version___6FBF826D] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK__c084__E3803056643DA39C] PRIMARY KEY CLUSTERED ([c084_id] ASC)
);

