﻿CREATE TABLE [ncts].[SENS_GOODS_CLASS] (
    [SID]               INT             NOT NULL,
    [HS_GOODS_CLASS_ID] VARCHAR (6)     NOT NULL,
    [SGI_COD]           CHAR (2)        NULL,
    [REF_QUANT]         DECIMAL (14, 3) NULL,
    [MEAS_UNIT_ID]      VARCHAR (3)     NULL,
    [EEC_TERR_LIM]      CHAR (1)        NULL,
    [DAT_START]         DATETIME        NOT NULL,
    [DAT_END]           DATETIME        NULL,
    CONSTRAINT [PK_SENS_GOODS_CLASS] PRIMARY KEY CLUSTERED ([SID] ASC)
);

