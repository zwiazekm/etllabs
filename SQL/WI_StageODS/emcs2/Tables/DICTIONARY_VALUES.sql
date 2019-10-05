CREATE TABLE [emcs2].[DICTIONARY_VALUES] (
    [ID]                           NUMERIC (38)   NOT NULL,
    [CODE]                         VARCHAR (10)   NOT NULL,
    [DESCRIPTION]                  NVARCHAR (900) NOT NULL,
    [DESCRIPTION_LANG_CODE]        VARCHAR (2)    NULL,
    [VALID_FROM]                   DATETIME2 (0)  NOT NULL,
    [VALID_TO]                     DATETIME2 (0)  NOT NULL,
    [DICT_ID]                      NUMERIC (38)   NOT NULL,
    [ACTION_IDENTIFIER]            VARCHAR (20)   NOT NULL,
    [INVALIDATE_ACTION_IDENTIFIER] VARCHAR (20)   NULL,
    CONSTRAINT [PK_DICTIONARY_VALUES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

