CREATE TABLE [aimp2].[ICS_OTHER_BUSINESS_ENTITY] (
    [ID]                       NUMERIC (19)  NOT NULL,
    [EMAIL]                    NVARCHAR (70) NULL,
    [EORI]                     NVARCHAR (17) NULL,
    [IDENTIFIER]               NVARCHAR (18) NULL,
    [NAME]                     NVARCHAR (70) NOT NULL,
    [REGON]                    NVARCHAR (14) NULL,
    [TIN]                      NVARCHAR (17) NULL,
    [OTHER_ADDRESS_ID]         NUMERIC (19)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)  NULL,
    [version]                  INT           NOT NULL,
    CONSTRAINT [ICS_OTHER_BUSINESS_ENTITY$ICS_OTHER__14455771571] PRIMARY KEY CLUSTERED ([ID] ASC)
);

