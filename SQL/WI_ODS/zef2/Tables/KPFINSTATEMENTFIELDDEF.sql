CREATE TABLE [zef2].[KPFINSTATEMENTFIELDDEF] (
    [LABEL]                 NVARCHAR (80)    DEFAULT ('') NOT NULL,
    [ALLOWEDIT]             INT              DEFAULT ((0)) NOT NULL,
    [FIELDIDX]              INT              DEFAULT ((0)) NOT NULL,
    [ORDERFLD]              INT              DEFAULT ((0)) NOT NULL,
    [FINANCIALPLAN]         INT              DEFAULT ((0)) NOT NULL,
    [EXECUTION]             INT              DEFAULT ((0)) NOT NULL,
    [CALCULATED]            INT              DEFAULT ((0)) NOT NULL,
    [XMLTAG]                NVARCHAR (50)    DEFAULT ('') NOT NULL,
    [FIELDSSUM]             NVARCHAR (120)   DEFAULT ('') NOT NULL,
    [ROWID]                 NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [FINSTATEMENTDEF_FK]    BIGINT           DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]      DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]            NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID] BIGINT           DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]       DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]             NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]  BIGINT           DEFAULT ((0)) NOT NULL,
    [RECVERSION]            INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]             BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                 BIGINT           NOT NULL,
    [MRDOSTAG]              NVARCHAR (30)    DEFAULT ('') NOT NULL,
    [TREZOREXCLUDEFROMXML]  INT              DEFAULT ((0)) NOT NULL,
    [AMOUNTROUNDOFF]        NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_103063RECID] PRIMARY KEY CLUSTERED ([RECID] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPFINSTATEMENTFIELDDEF] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

