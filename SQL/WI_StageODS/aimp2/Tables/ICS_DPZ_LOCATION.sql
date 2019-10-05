CREATE TABLE [aimp2].[ICS_DPZ_LOCATION] (
    [ID]                  NUMERIC (19)  NOT NULL,
    [DPZ_ID]              NUMERIC (19)  NOT NULL,
    [CODE]                NVARCHAR (35) NULL,
    [COUNTRY]             NVARCHAR (2)  NULL,
    [QUALIFIER]           NVARCHAR (1)  NULL,
    [LOCATION_CO]         NVARCHAR (17) NULL,
    [DESCRIPTION]         NVARCHAR (70) NULL,
    [TYPE]                NVARCHAR (1)  NULL,
    [ZCP_ADDRESS_ID]      NUMERIC (19)  NULL,
    [ADDITIONAL_IDENTITY] NVARCHAR (3)  NULL,
    [version]             INT           NOT NULL,
    CONSTRAINT [ICS_DPZ_LOCATION$ICS_DPZ_LO_19930551051] PRIMARY KEY CLUSTERED ([ID] ASC)
);

