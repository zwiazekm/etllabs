CREATE TABLE [emcs].[EMCS_DOWN_MESSAGES] (
    [ID]                     BIGINT          NOT NULL,
    [VERSION]                DECIMAL (1)     NOT NULL,
    [TYPE]                   VARCHAR (32)    NOT NULL,
    [SENDER]                 VARCHAR (36)    NOT NULL,
    [RECIPIENT]              VARCHAR (36)    NOT NULL,
    [PREPARATION_TIMESTAMP]  DATETIME        NOT NULL,
    [IDENTIFIER]             VARCHAR (44)    NOT NULL,
    [CORRELATION_IDENTIFIER] VARCHAR (44)    NULL,
    [BODY]                   VARBINARY (MAX) NULL,
    [MVMT_ID]                BIGINT          NOT NULL,
    CONSTRAINT [PK_DOWN_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

