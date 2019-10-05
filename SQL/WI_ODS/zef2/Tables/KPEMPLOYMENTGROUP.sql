CREATE TABLE [zef2].[KPEMPLOYMENTGROUP] (
    [EMPLOYMENTGROUPID]       NVARCHAR (10) DEFAULT ('') NOT NULL,
    [NAME]                    NVARCHAR (80) DEFAULT ('') NOT NULL,
    [MODIFIEDDATETIME]        DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]              NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID]   BIGINT        DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]         DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]               NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]    BIGINT        DEFAULT ((0)) NOT NULL,
    [RECVERSION]              INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]               BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                   BIGINT        NOT NULL,
    [FINSTATEMENTEMPLGROUPID] NVARCHAR (10) DEFAULT ('') NOT NULL,
    [BLOCKED]                 INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_103268RECID] PRIMARY KEY CLUSTERED ([RECID] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPEMPLOYMENTGROUP] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

