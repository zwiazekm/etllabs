﻿CREATE TABLE [ncts].[ENQUIRY_INF_DET] (
    [SID]                INT            NOT NULL,
    [ENQUIRY_INF_SID]    INT            NOT NULL,
    [ENQ_INF_COD_TYP_ID] DECIMAL (2)    NOT NULL,
    [ENQ_INF_TEXT]       NVARCHAR (420) NULL,
    CONSTRAINT [PK_ENQUIRY_INF_DET] PRIMARY KEY CLUSTERED ([SID] ASC)
);

