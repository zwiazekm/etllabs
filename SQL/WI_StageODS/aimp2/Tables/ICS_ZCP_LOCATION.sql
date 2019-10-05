CREATE TABLE [aimp2].[ICS_ZCP_LOCATION] (
    [ID]                  NUMERIC (19)  NOT NULL,
    [ZCP_ID]              NUMERIC (19)  NULL,
    [ZCP_ADDRESS_ID]      NUMERIC (19)  NULL,
    [CODE]                NVARCHAR (35) NULL,
    [COUNTRY]             NVARCHAR (2)  NULL,
    [QUALIFIER]           NVARCHAR (1)  NULL,
    [LOCATION_CO]         NVARCHAR (8)  NULL,
    [DESCRIPTION]         NVARCHAR (70) NULL,
    [TYPE]                NVARCHAR (1)  NULL,
    [ADDITIONAL_IDENTITY] NVARCHAR (3)  NULL,
    [version]             INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_LOCATION$PK_ICS_ZCP_LOCATION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

