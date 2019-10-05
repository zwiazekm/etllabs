﻿CREATE TABLE [aimp2].[ICS_OTHER_BUSINESS_ENTITY] (
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
    CONSTRAINT [ICS_OTHER_BUSINESS_ENTITY_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_OTHER_BUSINESS_ENTITY$FK_ICS_OTHER_BUSINESS_ENTITY_ICS_OTHER_ADDRESS] FOREIGN KEY ([OTHER_ADDRESS_ID]) REFERENCES [aimp2].[ICS_OTHER_ADDRESS] ([ID])
);

