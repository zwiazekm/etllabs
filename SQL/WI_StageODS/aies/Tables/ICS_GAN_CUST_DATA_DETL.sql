CREATE TABLE [aies].[ICS_GAN_CUST_DATA_DETL] (
    [ID]               NUMERIC (19) NOT NULL,
    [NUMBER]           INT          NULL,
    [STATUS]           VARCHAR (4)  NULL,
    [GAN_CUST_DATA_ID] NUMERIC (19) NULL,
    [ENS_ITEM_ID]      NUMERIC (19) NULL,
    [DISC_STATE]       VARCHAR (4)  NULL,
    [SEND_330]         TINYINT      NULL,
    [INTRO]            INT          NULL,
    [REJECT_REASON]    VARCHAR (4)  NULL,
    [SEND_349]         TINYINT      NULL,
    CONSTRAINT [ICS_GAN_CU_9913395651] PRIMARY KEY CLUSTERED ([ID] ASC)
);

