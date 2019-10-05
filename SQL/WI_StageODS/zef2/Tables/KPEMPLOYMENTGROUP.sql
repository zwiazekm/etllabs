CREATE TABLE [zef2].[KPEMPLOYMENTGROUP] (
    [EMPLOYMENTGROUPID]       NVARCHAR (10) NULL,
    [NAME]                    NVARCHAR (80) NULL,
    [MODIFIEDDATETIME]        DATETIME      NULL,
    [MODIFIEDBY]              NVARCHAR (8)  NULL,
    [MODIFIEDTRANSACTIONID]   BIGINT        NULL,
    [CREATEDDATETIME]         DATETIME      NULL,
    [CREATEDBY]               NVARCHAR (8)  NULL,
    [CREATEDTRANSACTIONID]    BIGINT        NULL,
    [RECVERSION]              INT           NULL,
    [PARTITION]               BIGINT        NULL,
    [RECID]                   BIGINT        NOT NULL,
    [FINSTATEMENTEMPLGROUPID] NVARCHAR (10) NULL,
    [BLOCKED]                 INT           NULL,
    [operacja]                NVARCHAR (1)  NULL,
    CONSTRAINT [I_103268RECID] PRIMARY KEY CLUSTERED ([RECID] ASC)
);

