CREATE TABLE [ARIFORM].[MF_USER] (
    [ID]                  BIGINT        NOT NULL,
    [LOGIN]               VARCHAR (255) NOT NULL,
    [PASSWORD]            VARCHAR (100) NOT NULL,
    [NAME]                VARCHAR (200) NOT NULL,
    [LAST_LOGIN_DATE]     DATETIME      NULL,
    [LAST_BAD_LOGIN_DATE] DATETIME      NULL,
    [PASSWD_CHANGE_DATE]  DATETIME      NOT NULL,
    [BAD_LOGIN_COUNT]     INT           NOT NULL,
    [BLOCKED]             INT           NOT NULL,
    [EDIT_PROFILE]        INT           NOT NULL,
    [CHANGE_PASSWORD]     INT           NOT NULL,
    [BLOCKED_TO]          DATETIME      NULL,
    [DESC]                VARCHAR (500) NULL,
    [EMAIL]               VARCHAR (250) NOT NULL,
    [DELETED]             INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([LOGIN] ASC)
);

