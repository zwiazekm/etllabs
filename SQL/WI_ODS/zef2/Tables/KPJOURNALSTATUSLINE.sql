﻿CREATE TABLE [zef2].[KPJOURNALSTATUSLINE] (
    [STATUS]                            NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [POSTINGREADY]                      INT              DEFAULT ((0)) NOT NULL,
    [GROUPIDSTATUS]                     NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CHECK_]                            INT              DEFAULT ((0)) NOT NULL,
    [ALLOWEDIT]                         INT              DEFAULT ((0)) NOT NULL,
    [STATUSNAMEID]                      NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [APPROVETRANS]                      INT              DEFAULT ((0)) NOT NULL,
    [POSITION]                          INT              DEFAULT ((0)) NOT NULL,
    [AMOUNTLIMITFROM]                   NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [AMOUNTLIMITTO]                     NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [REGACCEPTREADY]                    INT              DEFAULT ((0)) NOT NULL,
    [REGDOCUMENTDEL]                    INT              DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTABLEAPPROVED]         INT              DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTABLESENTTOPARENTUNIT] INT              DEFAULT ((0)) NOT NULL,
    [ACTIVECANCEL]                      INT              DEFAULT ((0)) NOT NULL,
    [BGTSENTTOPARENT]                   INT              DEFAULT ((0)) NOT NULL,
    [BGTSENTTOCHILD]                    INT              DEFAULT ((0)) NOT NULL,
    [ALLOWEDITGROUP]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BGTXMLGENERATED]                   INT              DEFAULT ((0)) NOT NULL,
    [ALLOWSTATUSCANCEL]                 INT              DEFAULT ((0)) NOT NULL,
    [ALLOWSTATUSCANCELGROUP]            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ALLOWSTATUSBACKGROUP]              NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ALLOWSTATUSBACK]                   INT              DEFAULT ((0)) NOT NULL,
    [DISABLECHANGESTATUS]               INT              DEFAULT ((0)) NOT NULL,
    [COMMENTMANDATORYONSET]             INT              DEFAULT ((0)) NOT NULL,
    [COMMENTMANDATORYONBACK]            INT              DEFAULT ((0)) NOT NULL,
    [COMMENTMANDATORYONCANCEL]          INT              DEFAULT ((0)) NOT NULL,
    [BGTSENTTODECISION]                 INT              DEFAULT ((0)) NOT NULL,
    [BGTSENTTODECISIONPARENT]           INT              DEFAULT ((0)) NOT NULL,
    [STOPONERROR]                       INT              DEFAULT ((0)) NOT NULL,
    [STATUSAUTONEXT]                    NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [DONTSTOPONPLANERROR]               INT              DEFAULT ((0)) NOT NULL,
    [ALLOWCHANGETRANSDATE]              INT              DEFAULT ((0)) NOT NULL,
    [REGAUTOACCEPTJOURNAL]              INT              DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTABLECANCELLED]        INT              DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTABLERECEIVED]         INT              DEFAULT ((0)) NOT NULL,
    [FINSTATEMENTTABLECHECKRECEIVED]    INT              DEFAULT ((0)) NOT NULL,
    [STATUSAUTOFIRST]                   INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]                  DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]                        NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [MODIFIEDTRANSACTIONID]             BIGINT           DEFAULT ((0)) NOT NULL,
    [CREATEDDATETIME]                   DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DEL_CREATEDTIME]                   INT              DEFAULT ((0)) NOT NULL,
    [CREATEDBY]                         NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [CREATEDTRANSACTIONID]              BIGINT           DEFAULT ((0)) NOT NULL,
    [RECVERSION]                        INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]                         BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                             BIGINT           NOT NULL,
    [REGJOURNALSTATUSALLOWCANCEL]       INT              DEFAULT ((0)) NOT NULL,
    [REGWITHAUCTIONALLOWEDIT]           INT              DEFAULT ((0)) NOT NULL,
    [SENDER]                            INT              DEFAULT ((0)) NOT NULL,
    [RECIPIENT]                         INT              DEFAULT ((0)) NOT NULL,
    [STATUSEXT]                         NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [CHECKLISTENABLED]                  INT              DEFAULT ((0)) NOT NULL,
    [CHECKLISTSETUPGROUP]               NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ALLOWORDERTOCASH]                  INT              NOT NULL,
    [BGTRECEIVED]                       INT              NOT NULL,
    CONSTRAINT [I_30695NAMESTATUSIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [STATUSNAMEID] ASC, [STATUS] ASC) ON [FG_ZEF2],
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
ALTER TABLE [zef2].[KPJOURNALSTATUSLINE] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

