﻿CREATE TABLE [emcs2].[MESSAGES] (
    [ID]                          NUMERIC (38)   NOT NULL,
    [CONTENTOBJECTID]             NUMERIC (20)   NULL,
    [FILEID]                      NUMERIC (20)   NULL,
    [CHECKEDOUTBYID]              NUMERIC (10)   NULL,
    [CHECKEDOUTON]                DATETIME2 (0)  NULL,
    [CHECKEDOUTCOMMENT]           VARCHAR (1000) NULL,
    [CHECKOUTEXPIRESON]           DATETIME2 (0)  NULL,
    [CHECKINPLANNEDON]            DATETIME2 (0)  NULL,
    [CREATEDON]                   DATETIME2 (0)  NULL,
    [CREATEDBYID]                 NUMERIC (10)   NULL,
    [MODIFIEDON]                  DATETIME2 (0)  NULL,
    [MODIFIEDBYID]                NUMERIC (10)   NULL,
    [VALIDFROM]                   DATETIME2 (0)  NULL,
    [VALIDTO]                     DATETIME2 (0)  NULL,
    [NEVEREXPIRES]                NUMERIC (1)    NULL,
    [DISPLAYNAME]                 VARCHAR (255)  NULL,
    [DESCRIPTION]                 VARCHAR (2000) NULL,
    [PARENTID]                    NUMERIC (10)   NULL,
    [CLASSIFIERID]                NUMERIC (10)   NULL,
    [LASTOPENBYID]                NUMERIC (10)   NULL,
    [LASTOPENON]                  DATETIME2 (0)  NULL,
    [CURRENTVERSIONID]            NUMERIC (20)   NULL,
    [ISARCHIVED]                  NUMERIC (1)    NULL,
    [ARCHIVEDON]                  DATETIME2 (0)  NULL,
    [ARCHIVECONTAINERID]          NUMERIC (10)   NULL,
    [ARCHIVEDBYID]                NUMERIC (10)   NULL,
    [WORKSTATUSID]                NUMERIC (10)   NULL,
    [APPROVALSTATUSID]            NUMERIC (10)   NULL,
    [APPROVERCOMMENTS]            VARCHAR (2000) NULL,
    [APPROVEDON]                  DATETIME2 (0)  NULL,
    [APPROVEDBYID]                NUMERIC (10)   NULL,
    [DIGITALSIGNATURESTATUSID]    NUMERIC (10)   NULL,
    [SIGNATUREVERIFIEDON]         DATETIME2 (0)  NULL,
    [SIGNATUREVERIFIEDBY]         NUMERIC (10)   NULL,
    [REGISTEREDON]                DATETIME2 (0)  NULL,
    [REGISTEREDBYID]              NUMERIC (10)   NULL,
    [REGISTRATIONCOMMENTS]        VARCHAR (2000) NULL,
    [SUBMITEDON]                  DATETIME2 (0)  NULL,
    [SUBMITEDBYID]                NUMERIC (10)   NULL,
    [SUBMISSIONCHANNELID]         NUMERIC (10)   NULL,
    [ISDELETED]                   NUMERIC (1)    NULL,
    [GLOBALTEMPLATEUSEDID]        NUMERIC (10)   NULL,
    [ISLOCALTEMPLATEUSED]         NUMERIC (1)    NULL,
    [BORROWEDBY]                  VARCHAR (255)  NULL,
    [BORROWEDON]                  DATETIME2 (0)  NULL,
    [BORROWSUMMARY]               VARCHAR (640)  NULL,
    [SGUID]                       VARCHAR (100)  NULL,
    [MSG_DATE]                    DATETIME2 (6)  NULL,
    [MSG_TYPE]                    VARCHAR (32)   NULL,
    [MSG_SENDER]                  VARCHAR (36)   NULL,
    [MSG_CORRELATION_IDENTIFIER]  VARCHAR (44)   NULL,
    [MSG_IDENTIFIER]              VARCHAR (44)   NULL,
    [MSG_RECIPIENT]               VARCHAR (36)   NULL,
    [MSG_PREPARATION_TIMESTAMP]   DATETIME2 (6)  NULL,
    [MSG_PROCESSED]               CHAR (1)       NULL,
    [MSG_SOURCE]                  VARCHAR (4)    NULL,
    [MSG_DESTINATION]             VARCHAR (4)    NULL,
    [MSG_EMAIL]                   VARCHAR (100)  NULL,
    [MSG_CD_MSG_ID]               VARCHAR (48)   NULL,
    [MSG_CD_CORREL_ID]            VARCHAR (48)   NULL,
    [MSG_LRN]                     NVARCHAR (66)  NULL,
    [MSG_MVMT_ID]                 NUMERIC (38)   NULL,
    [MSG_MVMT_ARC]                VARCHAR (21)   NULL,
    [MSG_MVMT_SEQUENCE_NUMBER]    NUMERIC (2)    NULL,
    [MSG_WF_IS_VALID]             CHAR (1)       NULL,
    [MSG_WF_MESSAGE]              VARCHAR (500)  NULL,
    [MSG_WF_SYNC_TOKEN]           VARCHAR (1000) NULL,
    [MSG_MANUAL_MODE]             CHAR (1)       NULL,
    [MSG_REQUEST_ID]              NUMERIC (38)   NULL,
    [MSG_REQUEST_SOURCE]          VARCHAR (50)   NULL,
    [MSG_OFFICE_REFERENCE_NUMBER] VARCHAR (8)    NULL,
    [MSG_USER_LOGIN]              VARCHAR (50)   NULL,
    [MSG_NEXT_PROCESSING_TIME]    DATETIME2 (6)  NOT NULL,
    [MSG_VERSION]                 NUMERIC (1)    NULL,
    [MSG_ID_PODMIOTU]             VARCHAR (50)   NULL,
    [MSG_ID_PODMIOTU_POSR]        VARCHAR (50)   NULL,
    [MSG_ID_OSOBY_ID_SEAP]        VARCHAR (50)   NULL,
    [MSG_ID_OSOBY_ID_SISC]        VARCHAR (50)   NULL,
    [MSG_ID_SPRAWY]               VARCHAR (50)   NULL,
    [MSG_ID_WPLYWU]               VARCHAR (50)   NULL,
    [MSG_LAST_BUSINESSLOG_ID]     NUMERIC (38)   NULL,
    CONSTRAINT [PK_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2]
);

