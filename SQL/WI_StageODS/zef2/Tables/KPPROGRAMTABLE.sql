CREATE TABLE [zef2].[KPPROGRAMTABLE] (
    [DESCRIPTION]               NVARCHAR (320) NULL,
    [NAME]                      NVARCHAR (256) NULL,
    [PROGRAMID]                 NVARCHAR (18)  NULL,
    [BLOCKED]                   INT            NULL,
    [FROMDATE]                  DATETIME       NULL,
    [VISIBLEINDIMATTRIBUTEVIEW] INT            NULL,
    [MODIFIEDDATETIME]          DATETIME       NULL,
    [MODIFIEDBY]                NVARCHAR (8)   NULL,
    [MODIFIEDTRANSACTIONID]     BIGINT         NULL,
    [CREATEDDATETIME]           DATETIME       NULL,
    [CREATEDBY]                 NVARCHAR (8)   NULL,
    [CREATEDTRANSACTIONID]      BIGINT         NULL,
    [RECVERSION]                INT            NULL,
    [PARTITION]                 BIGINT         NULL,
    [RECID]                     BIGINT         NOT NULL,
    [PROGRAMGROUPTABLE_FK]      BIGINT         NULL,
    [NAMEFORSTATEMENT]          NVARCHAR (250) NULL,
    [operacja]                  NVARCHAR (1)   NULL,
    CONSTRAINT [I_30313RECID] PRIMARY KEY CLUSTERED ([RECID] ASC)
);

