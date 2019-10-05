CREATE TABLE [emcs].[PACKAGING_CODES] (
    [ID]                           BIGINT         NOT NULL,
    [CODE]                         CHAR (2)       NOT NULL,
    [DESCRIPTION]                  NVARCHAR (300) NOT NULL,
    [DESCRIPTION_LANG_CODE]        CHAR (2)       NULL,
    [COUNTABLE]                    CHAR (1)       DEFAULT ('0') NOT NULL,
    [VALID_FROM]                   DATE           NOT NULL,
    [VALID_TO]                     DATE           DEFAULT ('9999-12-31') NOT NULL,
    [ACTION_IDENTIFIER]            VARCHAR (20)   NOT NULL,
    [INVALIDATE_ACTION_IDENTIFIER] VARCHAR (20)   NULL,
    [SEED_CODE]                    VARCHAR (4)    NULL,
    CONSTRAINT [PK_PACKAGING_CODES] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UK_PACKAGING_CODES_1] UNIQUE NONCLUSTERED ([VALID_FROM] ASC, [CODE] ASC)
);

