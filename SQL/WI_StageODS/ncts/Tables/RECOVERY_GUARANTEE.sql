﻿CREATE TABLE [ncts].[RECOVERY_GUARANTEE] (
    [SID]                     INT          NOT NULL,
    [GRN]                     VARCHAR (24) NOT NULL,
    [RECOVERY_ACCEPTANCE_SID] INT          NULL,
    [RECOVERY_REQUEST_SID]    INT          NULL,
    CONSTRAINT [PK_RECOVERY_GUARANTEE] PRIMARY KEY CLUSTERED ([SID] ASC)
);

