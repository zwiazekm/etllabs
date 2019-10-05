CREATE TABLE [zef2].[KPFINSTATEMENTROWDEF] (
    [ROWID]                 NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [NAME]                  NVARCHAR (250) DEFAULT ('') NOT NULL,
    [NUM]                   INT            DEFAULT ((0)) NOT NULL,
    [XMLTAG]                NVARCHAR (30)  DEFAULT ('') NOT NULL,
    [CALCEXPRESSION]        NVARCHAR (250) DEFAULT ('') NOT NULL,
    [DYNAMICROW]            INT            DEFAULT ((0)) NOT NULL,
    [DATETO]                DATETIME       DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [CONSOLIDATEDROWID]     NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [FINSTATEMENTDEF_FK]    BIGINT         DEFAULT ((0)) NOT NULL,
    [HEADERROW]             INT            DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]      DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]            NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID] BIGINT         DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]       DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]             NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]  BIGINT         DEFAULT ((0)) NOT NULL,
    [RECVERSION]            INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]             BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                 BIGINT         NOT NULL,
    [KPFINSTATEMENTROWTYPE] INT            DEFAULT ((0)) NOT NULL,
    [TREZORCHAPTERCODE]     NVARCHAR (60)  DEFAULT ('') NOT NULL,
    [TREZORPOSITIONCODE]    NVARCHAR (60)  DEFAULT ('') NOT NULL,
    CONSTRAINT [I_103069RECID] PRIMARY KEY CLUSTERED ([RECID] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPFINSTATEMENTROWDEF] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

