CREATE TABLE [aimp2].[ICS_ZCP_WDZ] (
    [ID]                 NUMERIC (19)    NOT NULL,
    [ZCP_ID]             NUMERIC (19)    NULL,
    [MRN]                NVARCHAR (18)   NULL,
    [WDZ_NO]             NUMERIC (5)     NULL,
    [PROPRIETARY_WDZ_NO] NVARCHAR (35)   NULL,
    [STATUS]             NVARCHAR (4)    NULL,
    [COMMENTS]           NVARCHAR (1024) NULL,
    [SELF_REF_282]       NVARCHAR (35)   NULL,
    [SELF_REF_283]       NVARCHAR (35)   NULL,
    [TIN]                NVARCHAR (17)   NULL,
    [AUTHOR]             NVARCHAR (255)  NULL,
    [CREATION_DATE]      DATETIME2 (3)   NULL,
    [version]            INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_WDZ$PK_ICS_ZCP_WDZ] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_WDZ$FK_ICS_ZCP_WDZ_ICS_ZCP] FOREIGN KEY ([ZCP_ID]) REFERENCES [aimp2].[ICS_ZCP] ([ID])
);

