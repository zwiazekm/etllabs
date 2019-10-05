CREATE TABLE [aes2].[ecs_zwp_trader_at_present] (
    [id]                    NUMERIC (19)   NOT NULL,
    [street_and_no]         NVARCHAR (210) NULL,
    [postcode]              NVARCHAR (9)   NULL,
    [city]                  NVARCHAR (210) NULL,
    [name_f]                NVARCHAR (210) NULL,
    [country]               NVARCHAR (2)   NULL,
    [tin]                   NVARCHAR (17)  NULL,
    [declcopresent_decl_id] NUMERIC (19)   NOT NULL,
    [eori]                  NVARCHAR (17)  NULL,
    [email]                 NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_zwp_trader_at_present$PK_ecs_zwp_trader_at_present] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_trader_at_present$FK_ecs_zwp_trader_at_present_ecs_zwp_declcopresent] FOREIGN KEY ([declcopresent_decl_id]) REFERENCES [aes2].[ecs_zwp_declcopresent] ([decl_id])
);

