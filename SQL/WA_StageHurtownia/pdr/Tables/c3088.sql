CREATE TABLE [pdr].[c3088] (
    [c3088_id]             INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [idurzedy]             NVARCHAR (8)  NOT NULL,
    [last_modification_tm] DATETIME      NULL,
    [nazwaurzedu]          NVARCHAR (80) NOT NULL,
    [valid_from]           DATE          NOT NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        CONSTRAINT [DF__c3088__version___102C51FF] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__c3088__ADA2CB6ABAE7D72A] PRIMARY KEY CLUSTERED ([c3088_id] ASC)
);

