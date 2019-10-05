CREATE TABLE [aes2].[ecs_exp_trader_at_present] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (420) NULL,
    [postcode]                 NVARCHAR (9)   NULL,
    [city]                     NVARCHAR (420) NULL,
    [name_f]                   NVARCHAR (420) NULL,
    [country]                  NVARCHAR (2)   NULL,
    [tin]                      NVARCHAR (17)  NULL,
    [declcoexport_decl_id]     NUMERIC (19)   NOT NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_exp_trader_at_present$PK_ecs_exp_trader_at_present] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_trader_at_present$FK_ecs_exp_trader_at_present_ecs_exp_declcoexport] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

