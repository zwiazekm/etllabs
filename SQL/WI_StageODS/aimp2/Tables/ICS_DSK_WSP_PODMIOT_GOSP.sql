﻿CREATE TABLE [aimp2].[ICS_DSK_WSP_PODMIOT_GOSP] (
    [ID]                        NUMERIC (19)  NOT NULL,
    [DSK_WSP_ADRES_ID]          NUMERIC (19)  NULL,
    [EMAIL]                     NVARCHAR (70) NULL,
    [EORI]                      NVARCHAR (17) NULL,
    [NAZWA]                     NVARCHAR (70) NULL,
    [REGON]                     NVARCHAR (14) NULL,
    [TIN]                       NVARCHAR (17) NULL,
    [PLACOWKA_PODMIOTU]         NCHAR (2)     NULL,
    [RODZAJ_PRZEDSTAWICIELSTWA] NCHAR (3)     NULL,
    [AEO_CERTIFICATE_GROUP_ID]  NUMERIC (19)  NULL,
    [NR_IDENTYFIKACYJNY]        NVARCHAR (30) NULL,
    [version]                   INT           NOT NULL,
    CONSTRAINT [ICS_DSK_WSP_PODMIOT_GOSP$PK_ICS_DSK_WSP_PODMIOT_GOSP] PRIMARY KEY CLUSTERED ([ID] ASC)
);

