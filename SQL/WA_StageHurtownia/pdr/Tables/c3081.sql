CREATE TABLE [pdr].[c3081] (
    [c3081_id]                 INT           NOT NULL,
    [creation_tm]              DATETIME      NULL,
    [idodroczeniaplatnosci]    INT           NOT NULL,
    [last_modification_tm]     DATETIME      NULL,
    [valid_from]               DATE          NOT NULL,
    [valid_to]                 DATE          NULL,
    [version_]                 BIGINT        NULL,
    [formaodroczeniaplatnosci] NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK__c3081__793F7EFF5CD08D7B] PRIMARY KEY CLUSTERED ([c3081_id] ASC)
);

