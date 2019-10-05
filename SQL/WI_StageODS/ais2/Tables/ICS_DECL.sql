CREATE TABLE [ais2].[ICS_DECL] (
    [ID]           NUMERIC (19) NOT NULL,
    [TYPE]         VARCHAR (4)  NULL,
    [FLAG]         VARCHAR (4)  NULL,
    [MANUAL]       TINYINT      NULL,
    [REF_NO]       VARCHAR (35) NULL,
    [RETR_EMAIL]   VARCHAR (80) NULL,
    [RETR_POST]    VARCHAR (2)  NULL,
    [SELF_REF]     VARCHAR (35) NULL,
    [SIGN]         TINYINT      NULL,
    [VERSION]      INT          NULL,
    [dts]          CHAR (1)     NOT NULL,
    [aeo]          TINYINT      NOT NULL,
    [segmentation] TEXT         NULL,
    [TYPED]        VARCHAR (4)  NULL,
    [EMERGENCY]    TINYINT      NULL,
    [REF_NO_PAPER] VARCHAR (35) NULL,
    CONSTRAINT [ICS_DECL$ICS_DECL_3833373991] PRIMARY KEY CLUSTERED ([ID] ASC)
);

