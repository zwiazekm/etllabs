CREATE TABLE [emcs].[EMCS_ACO_MESSAGES] (
    [ID]          BIGINT          NOT NULL,
    [ACO_ID]      BIGINT          NOT NULL,
    [PSIN_ID]     BIGINT          NULL,
    [TYPE]        VARCHAR (9)     NOT NULL,
    [BODY]        VARBINARY (MAX) NULL,
    [STATUS]      CHAR (1)        NOT NULL,
    [CREATE_DATE] DATETIME        NOT NULL,
    [CREATE_BY]   VARCHAR (50)    NOT NULL,
    [CHANGE_DATE] DATETIME        NULL,
    [CHANGE_BY]   VARCHAR (50)    NULL,
    [VERSION]     INT             NOT NULL,
    CONSTRAINT [PK_ACO_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

