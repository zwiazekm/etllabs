CREATE TABLE [ais2].[ICS_GAN_CUST] (
    [ID]                       NUMERIC (19)  NOT NULL,
    [EMAIL]                    VARCHAR (255) NULL,
    [NAME]                     VARCHAR (35)  NULL,
    [TIN]                      VARCHAR (17)  NULL,
    [CITY]                     VARCHAR (35)  NULL,
    [COUNTRY]                  VARCHAR (2)   NULL,
    [POST_CODE]                VARCHAR (9)   NULL,
    [STREET]                   VARCHAR (35)  NULL,
    [CUST_TYPE]                VARCHAR (4)   NULL,
    [GAN_ID]                   NUMERIC (19)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)  NULL,
    CONSTRAINT [ICS_GAN_CUST$ICS_GAN_CU_9273393371] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIS2],
    CONSTRAINT [ICS_GAN_CUST$FK2B14C40490199880] FOREIGN KEY ([GAN_ID]) REFERENCES [ais2].[ICS_GAN] ([ID])
);

