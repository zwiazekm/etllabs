CREATE TABLE [aes2].[ecs_sum_trader_at_exit] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [city]                     NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [exs_id]                   NUMERIC (19)   NULL,
    [return_email]             NVARCHAR (80)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_sum_trader_at_exit$ecs_sum_tr_9134352971] PRIMARY KEY CLUSTERED ([id] ASC)
);

