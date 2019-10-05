CREATE TABLE [pdr].[c3010] (
    [c3010_id]             INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [dysponentiiistopnia]  INT            NULL,
    [dysponentiistopnia]   INT            NULL,
    [dysponentistopnia]    INT            NULL,
    [dysponentivstopnia]   INT            NULL,
    [dysponentvstopnia]    INT            NULL,
    [jednostkanadrzedna]   NVARCHAR (10)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (256) NULL,
    [organegzekucyjny]     INT            NULL,
    [pionmf]               NVARCHAR (64)  NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__c3010__version___4EE89E87] DEFAULT ((0)) NOT NULL,
    [zablokowane]          INT            NULL,
    CONSTRAINT [PK__c3010__8365FAE1FDD4E196] PRIMARY KEY CLUSTERED ([c3010_id] ASC) ON [FG_PDR]
);

