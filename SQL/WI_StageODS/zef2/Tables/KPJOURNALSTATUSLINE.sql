﻿CREATE TABLE [zef2].[KPJOURNALSTATUSLINE] (
    [STATUS]                            NVARCHAR (20)    NOT NULL,
    [POSTINGREADY]                      INT              NULL,
    [GROUPIDSTATUS]                     NVARCHAR (10)    NULL,
    [CHECK_]                            INT              NULL,
    [ALLOWEDIT]                         INT              NULL,
    [STATUSNAMEID]                      NVARCHAR (10)    NOT NULL,
    [APPROVETRANS]                      INT              NULL,
    [POSITION]                          INT              NULL,
    [AMOUNTLIMITFROM]                   NUMERIC (32, 16) NULL,
    [AMOUNTLIMITTO]                     NUMERIC (32, 16) NULL,
    [REGACCEPTREADY]                    INT              NULL,
    [REGDOCUMENTDEL]                    INT              NULL,
    [FINSTATEMENTTABLEAPPROVED]         INT              NULL,
    [FINSTATEMENTTABLESENTTOPARENTUNIT] INT              NULL,
    [ACTIVECANCEL]                      INT              NULL,
    [BGTSENTTOPARENT]                   INT              NULL,
    [BGTSENTTOCHILD]                    INT              NULL,
    [ALLOWEDITGROUP]                    NVARCHAR (10)    NULL,
    [BGTXMLGENERATED]                   INT              NULL,
    [ALLOWSTATUSCANCEL]                 INT              NULL,
    [ALLOWSTATUSCANCELGROUP]            NVARCHAR (10)    NULL,
    [ALLOWSTATUSBACKGROUP]              NVARCHAR (10)    NULL,
    [ALLOWSTATUSBACK]                   INT              NULL,
    [DISABLECHANGESTATUS]               INT              NULL,
    [COMMENTMANDATORYONSET]             INT              NULL,
    [COMMENTMANDATORYONBACK]            INT              NULL,
    [COMMENTMANDATORYONCANCEL]          INT              NULL,
    [BGTSENTTODECISION]                 INT              NULL,
    [BGTSENTTODECISIONPARENT]           INT              NULL,
    [STOPONERROR]                       INT              NULL,
    [STATUSAUTONEXT]                    NVARCHAR (20)    NULL,
    [DONTSTOPONPLANERROR]               INT              NULL,
    [ALLOWCHANGETRANSDATE]              INT              NULL,
    [REGAUTOACCEPTJOURNAL]              INT              NULL,
    [FINSTATEMENTTABLECANCELLED]        INT              NULL,
    [FINSTATEMENTTABLERECEIVED]         INT              NULL,
    [FINSTATEMENTTABLECHECKRECEIVED]    INT              NULL,
    [STATUSAUTOFIRST]                   INT              NULL,
    [MODIFIEDDATETIME]                  DATETIME         NULL,
    [MODIFIEDBY]                        NVARCHAR (8)     NULL,
    [MODIFIEDTRANSACTIONID]             BIGINT           NULL,
    [CREATEDDATETIME]                   DATETIME         NULL,
    [DEL_CREATEDTIME]                   INT              NULL,
    [CREATEDBY]                         NVARCHAR (8)     NULL,
    [CREATEDTRANSACTIONID]              BIGINT           NULL,
    [RECVERSION]                        INT              NULL,
    [PARTITION]                         BIGINT           NOT NULL,
    [RECID]                             BIGINT           NULL,
    [REGJOURNALSTATUSALLOWCANCEL]       INT              NULL,
    [REGWITHAUCTIONALLOWEDIT]           INT              NULL,
    [SENDER]                            INT              NULL,
    [RECIPIENT]                         INT              NULL,
    [STATUSEXT]                         NVARCHAR (20)    NULL,
    [CHECKLISTENABLED]                  INT              NULL,
    [CHECKLISTSETUPGROUP]               NVARCHAR (10)    NULL,
    [ALLOWORDERTOCASH]                  INT              NULL,
    [BGTRECEIVED]                       INT              NULL,
    [operacja]                          NVARCHAR (1)     NULL,
    CONSTRAINT [I_30695NAMESTATUSIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [STATUSNAMEID] ASC, [STATUS] ASC)
);

