CREATE TABLE [aimp2].[ICS_ZCP_EAD_INFO] (
    [ID]                     NUMERIC (19)   NOT NULL,
    [REQ_DATE]               DATETIME2 (3)  NULL,
    [REQ_LRN]                NVARCHAR (44)  NULL,
    [RESULT_CODE]            NUMERIC (19)   NULL,
    [RESULT_ADDITIONAL_INFO] NVARCHAR (350) NULL,
    [ARC]                    NVARCHAR (21)  NULL,
    [DECL_ID]                NUMERIC (19)   NOT NULL,
    [EAD_REF]                NVARCHAR (35)  NULL,
    [OPERATION_STATUS]       NVARCHAR (30)  NULL,
    [POWIADOM_KOD]           NCHAR (1)      NULL,
    [OPERATION]              NVARCHAR (40)  NULL,
    [CREATED_STAMP]          DATETIME2 (3)  NULL,
    [RETRY_TIMES]            INT            NOT NULL,
    [FINAL_INCONS]           NCHAR (1)      NULL,
    [version]                INT            NOT NULL,
    CONSTRAINT [ICS_ZCP_EAD_INFO$ICS_ZCP_EA_19701030281] PRIMARY KEY CLUSTERED ([ID] ASC)
);

