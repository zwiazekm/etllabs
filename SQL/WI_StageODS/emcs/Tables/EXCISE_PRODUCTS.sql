﻿CREATE TABLE [emcs].[EXCISE_PRODUCTS] (
    [ID]                           BIGINT         NOT NULL,
    [CODE]                         VARCHAR (4)    NOT NULL,
    [DESCRIPTION]                  NVARCHAR (300) NOT NULL,
    [DESCRIPTION_LANG_CODE]        CHAR (2)       NULL,
    [CATEGORY]                     CHAR (1)       NOT NULL,
    [UNIT_OF_MEASURE]              CHAR (1)       NOT NULL,
    [ALCOHOLIC_STRENGTH_REQ]       CHAR (1)       DEFAULT ('0') NOT NULL,
    [DEGREE_PLATO_REQ]             CHAR (1)       DEFAULT ('0') NOT NULL,
    [DENSITY_REQ]                  CHAR (1)       DEFAULT ('0') NOT NULL,
    [POLISH_CODE]                  CHAR (1)       DEFAULT ('0') NOT NULL,
    [VALID_FROM]                   DATE           NOT NULL,
    [VALID_TO]                     DATE           DEFAULT ('9999-12-31') NOT NULL,
    [ACTION_IDENTIFIER]            VARCHAR (20)   NOT NULL,
    [INVALIDATE_ACTION_IDENTIFIER] VARCHAR (20)   NULL,
    CONSTRAINT [PK_EXCISE_PRODUCTS] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UK_EXCISE_PRODUCTS_1] UNIQUE NONCLUSTERED ([VALID_FROM] ASC, [CODE] ASC)
);

