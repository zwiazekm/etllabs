CREATE TABLE [zef2].[KPCLASSIFICATIONATTRIBUTETABLE] (
    [ATTRIBUTEID]                      NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [NAME]                             NVARCHAR (256) DEFAULT ('') NOT NULL,
    [BLOCKED]                          INT            DEFAULT ((0)) NOT NULL,
    [TYPE]                             INT            DEFAULT ((0)) NOT NULL,
    [SUBTYPE]                          INT            DEFAULT ((0)) NOT NULL,
    [CLASSIFICATIONATTRIBUTEPARENT_FK] BIGINT         DEFAULT ((0)) NOT NULL,
    [REQUIREDINCLASSIFICATION_PROGRAM] INT            DEFAULT ((0)) NOT NULL,
    [REQUIREDINCLASSIFICATION_PROJECT] INT            DEFAULT ((0)) NOT NULL,
    [DEFAULTEMPLOYMENTGROUP_FK]        BIGINT         DEFAULT ((0)) NOT NULL,
    [ECONGROUPGENERAL_FK]              BIGINT         DEFAULT ((0)) NOT NULL,
    [VISIBLEINDIMATTRIBUTEVIEW]        INT            DEFAULT ((0)) NOT NULL,
    [DEFAULTBGTTYPE_FK]                BIGINT         DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]                 DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]                       NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID]            BIGINT         DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]                  DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]                        NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]             BIGINT         DEFAULT ((0)) NOT NULL,
    [RECVERSION]                       INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]                        BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                            BIGINT         NOT NULL,
    [REQUIREDEMPLGROUPFORLIMITS]       INT            DEFAULT ((0)) NOT NULL,
    [NATIVESUBSECTION_IC]              INT            DEFAULT ((0)) NOT NULL,
    [NATIVESUBSECTION_IS]              INT            DEFAULT ((0)) NOT NULL,
    [NATIVESUBSECTION_UKS]             INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_103071RECID] PRIMARY KEY CLUSTERED ([RECID] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPCLASSIFICATIONATTRIBUTETABLE] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

