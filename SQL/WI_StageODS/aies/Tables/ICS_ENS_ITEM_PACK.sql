CREATE TABLE [aies].[ICS_ENS_ITEM_PACK] (
    [ID]               NUMERIC (19)  NOT NULL,
    [ITEM_COUNT]       INT           NULL,
    [ITEM_COUNT_BR]    INT           NULL,
    [PACK_KIND]        VARCHAR (2)   NULL,
    [PACK_KIND_BR]     VARCHAR (2)   NULL,
    [PACK_MARKS]       VARCHAR (140) NULL,
    [PACK_MARKS_BR]    VARCHAR (140) NULL,
    [PACKAGE_COUNT]    INT           NULL,
    [PACKAGE_COUNT_BR] INT           NULL,
    [STATE_BR]         VARCHAR (4)   NULL,
    [ENS_ITEM_ID]      NUMERIC (19)  NOT NULL
);

