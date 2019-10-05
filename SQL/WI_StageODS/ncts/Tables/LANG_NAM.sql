CREATE TABLE [ncts].[LANG_NAM] (
    [LANG_ID]    CHAR (2)      NOT NULL,
    [IN_LANG_ID] CHAR (2)      NOT NULL,
    [NAM]        VARCHAR (140) NOT NULL,
    [DAT_START]  DATETIME      NULL,
    [DAT_END]    DATETIME      NULL
);

