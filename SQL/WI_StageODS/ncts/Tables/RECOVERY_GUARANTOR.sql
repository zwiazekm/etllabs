﻿CREATE TABLE [ncts].[RECOVERY_GUARANTOR] (
    [SID]                     INT            NOT NULL,
    [CITY]                    NVARCHAR (105) NULL,
    [NAM]                     NVARCHAR (105) NULL,
    [POST_COD]                VARCHAR (27)   NULL,
    [STR_AND_NUMB]            NVARCHAR (105) NULL,
    [CONTACT_DETAILS]         NVARCHAR (420) NULL,
    [RECOVERY_ACCEPTANCE_SID] INT            NULL,
    [RECOVERY_REQUEST_SID]    INT            NULL,
    [GUARANTOR_TIN]           VARCHAR (17)   NULL,
    CONSTRAINT [PK_RECOVERY_GUARANTOR] PRIMARY KEY CLUSTERED ([SID] ASC)
);

