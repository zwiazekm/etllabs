CREATE TABLE [emcs].[DICTIONARY_VALUES] (
    [ID]                           BIGINT         NOT NULL,
    [CODE]                         VARCHAR (10)   NOT NULL,
    [DESCRIPTION]                  NVARCHAR (300) NOT NULL,
    [DESCRIPTION_LANG_CODE]        CHAR (2)       NULL,
    [VALID_FROM]                   DATE           NOT NULL,
    [VALID_TO]                     DATE           DEFAULT ('9999-12-31') NOT NULL,
    [DICT_ID]                      BIGINT         NOT NULL,
    [ACTION_IDENTIFIER]            VARCHAR (20)   NOT NULL,
    [INVALIDATE_ACTION_IDENTIFIER] VARCHAR (20)   NULL,
    CONSTRAINT [PK_DICTIONARY_VALUES] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_EMCS]
);

