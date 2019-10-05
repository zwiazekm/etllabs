CREATE TABLE [emcs2].[EMCS_FUEL_EXCISE_RATES] (
    [ID]                          NUMERIC (10)    NOT NULL,
    [VALID_FROM]                  DATETIME2 (0)   NOT NULL,
    [EXCISE_NUMBER_CODE]          VARCHAR (4)     NOT NULL,
    [CN_CODE_FROM]                VARCHAR (8)     NOT NULL,
    [CN_CODE_TO]                  VARCHAR (8)     NOT NULL,
    [AMOUNT_RATE]                 NUMERIC (15, 5) NOT NULL,
    [ALGORITHM_TYPE]              CHAR (1)        NOT NULL,
    [VALID_TO]                    DATETIME2 (0)   NULL,
    [MEETS_QUALITY_REQUIREMENTS]  CHAR (1)        NULL,
    [DENSITY_FROM]                NUMERIC (15, 5) NULL,
    [DENSITY_TO]                  NUMERIC (15, 5) NULL,
    [NOT_COLORED_AND_MARKED_OILS] CHAR (1)        NULL,
    [FUEL_TYPE]                   CHAR (1)        NULL,
    CONSTRAINT [EMCS_FUEL_EXCISE_RATES_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

