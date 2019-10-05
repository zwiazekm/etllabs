CREATE TABLE [emcs2].[EMCS_DOWN_MESSAGES] (
    [ID]                     NUMERIC (38)    NOT NULL,
    [VERSION]                NUMERIC (1)     NOT NULL,
    [TYPE]                   VARCHAR (32)    NOT NULL,
    [SENDER]                 VARCHAR (36)    NOT NULL,
    [RECIPIENT]              VARCHAR (36)    NOT NULL,
    [PREPARATION_TIMESTAMP]  DATETIME2 (6)   NOT NULL,
    [IDENTIFIER]             VARCHAR (44)    NOT NULL,
    [CORRELATION_IDENTIFIER] VARCHAR (44)    NULL,
    [BODY]                   VARBINARY (MAX) NOT NULL,
    [MVMT_ID]                NUMERIC (38)    NOT NULL,
    CONSTRAINT [PK_DOWN_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

