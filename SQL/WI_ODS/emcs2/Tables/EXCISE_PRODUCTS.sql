CREATE TABLE [emcs2].[EXCISE_PRODUCTS] (
    [ID]                           NUMERIC (38)   NOT NULL,
    [CODE]                         VARCHAR (4)    NOT NULL,
    [DESCRIPTION]                  NVARCHAR (900) NOT NULL,
    [DESCRIPTION_LANG_CODE]        VARCHAR (2)    NULL,
    [CATEGORY]                     CHAR (1)       NOT NULL,
    [UNIT_OF_MEASURE]              CHAR (1)       NOT NULL,
    [ALCOHOLIC_STRENGTH_REQ]       CHAR (1)       NOT NULL,
    [DEGREE_PLATO_REQ]             CHAR (1)       NOT NULL,
    [DENSITY_REQ]                  CHAR (1)       NOT NULL,
    [POLISH_CODE]                  CHAR (1)       NOT NULL,
    [VALID_FROM]                   DATETIME2 (0)  NOT NULL,
    [VALID_TO]                     DATETIME2 (0)  NOT NULL,
    [ACTION_IDENTIFIER]            VARCHAR (20)   NOT NULL,
    [INVALIDATE_ACTION_IDENTIFIER] VARCHAR (20)   NULL,
    CONSTRAINT [PK_EXCISE_PRODUCTS] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [UK_EXCISE_PRODUCTS_1] UNIQUE NONCLUSTERED ([CODE] ASC, [VALID_FROM] ASC) ON [FG_EMCS2]
);

