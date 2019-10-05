CREATE TABLE [aimp2].[ICS_DECL] (
    [ID]              NUMERIC (19)   NOT NULL,
    [TYPE]            NVARCHAR (4)   NULL,
    [FLAG]            NVARCHAR (4)   NULL,
    [MANUAL]          TINYINT        NULL,
    [REF_NO]          NVARCHAR (35)  NULL,
    [RETR_EMAIL]      NVARCHAR (80)  NULL,
    [RETR_POST]       NVARCHAR (2)   NULL,
    [SELF_REF]        NVARCHAR (35)  NULL,
    [SIGN]            TINYINT        NULL,
    [VERSION]         INT            NULL,
    [dts]             NCHAR (1)      NOT NULL,
    [aeo]             TINYINT        NOT NULL,
    [segmentation]    NTEXT          NULL,
    [TYPED]           NVARCHAR (4)   NULL,
    [EMERGENCY]       TINYINT        NULL,
    [REF_NO_PAPER]    NVARCHAR (35)  NULL,
    [trad_com_system] NVARCHAR (1)   NULL,
    [login]           NVARCHAR (255) NULL,
    [ULOCK_FLAG]      BIT            NOT NULL,
    [ULOCK_TIME]      DATETIME2 (3)  NULL,
    CONSTRAINT [ICS_DECL_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2]
) TEXTIMAGE_ON [FG_AIMP2];

