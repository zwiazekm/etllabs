CREATE TABLE [aimp2].[ICS_ZCP_PODZ] (
    [ID]                  NUMERIC (19)    NOT NULL,
    [ZCP_ID]              NUMERIC (19)    NULL,
    [MRN]                 NVARCHAR (18)   NULL,
    [PODZ_NO]             NUMERIC (5)     NULL,
    [PROPRIETARY_PODZ_NO] NVARCHAR (35)   NULL,
    [STATUS]              NVARCHAR (4)    NULL,
    [COMMENTS]            NVARCHAR (1024) NULL,
    [TIN]                 NVARCHAR (17)   NULL,
    [CREATION_DATE]       DATETIME2 (3)   NULL,
    [SELF_REF_284]        NVARCHAR (35)   NULL,
    [SELF_REF_285]        NVARCHAR (35)   NULL,
    [version]             INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_PODZ$PK_ICS_ZCP_PODZ] PRIMARY KEY CLUSTERED ([ID] ASC)
);

