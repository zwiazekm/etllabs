CREATE TABLE [aimp2].[ICS_ZCP_BONDED_WAREHOUSE] (
    [ID]                    NUMERIC (19)  NOT NULL,
    [ZCP_ID]                NUMERIC (19)  NULL,
    [COUNTRY_OF_PERMISSION] NVARCHAR (2)  NULL,
    [ID_NO]                 NVARCHAR (17) NULL,
    [TYPE]                  NVARCHAR (1)  NULL,
    [version]               INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_BONDED_WAREHOUSE$PK_ICS_ZCP_BONDED_WAREHOUSE] PRIMARY KEY CLUSTERED ([ID] ASC)
);

