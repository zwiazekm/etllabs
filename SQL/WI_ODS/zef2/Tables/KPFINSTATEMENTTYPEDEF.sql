CREATE TABLE [zef2].[KPFINSTATEMENTTYPEDEF] (
    [FINSTATEMENTTYPEDEFID]    NVARCHAR (15)  DEFAULT ('') NOT NULL,
    [DESCRIPTION]              NVARCHAR (255) DEFAULT ('') NOT NULL,
    [FINSTATEMENTTYPE]         INT            DEFAULT ((0)) NOT NULL,
    [PERIODTYPE]               INT            DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTYPEDEFGENID] NVARCHAR (20)  DEFAULT ('') NOT NULL,
    [MODIFIEDDATETIME]         DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]               NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID]    BIGINT         DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]          DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]                NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]     BIGINT         DEFAULT ((0)) NOT NULL,
    [RECVERSION]               INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]                BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                    BIGINT         NOT NULL,
    [MRDOSRODZAJDOK]           NVARCHAR (20)  DEFAULT ('') NOT NULL,
    [MRDOSIMPORT]              INT            DEFAULT ((0)) NOT NULL,
    [CONSOLIDATION]            INT            DEFAULT ((0)) NOT NULL,
    [MODULE]                   INT            DEFAULT ((0)) NOT NULL,
    [ALLOWTOALLDATAAREA]       INT            DEFAULT ((0)) NOT NULL,
    [DOCUMENTCODE]             NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [ALLOWSENDTOTREZOR]        INT            DEFAULT ((0)) NOT NULL,
    [TREZORPROCESSCODE]        NVARCHAR (20)  DEFAULT ('') NOT NULL,
    [USERGROUPID]              NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [FINSTATEMENTUNITTYPE]     INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_103044RECID] PRIMARY KEY CLUSTERED ([RECID] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPFINSTATEMENTTYPEDEF] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

