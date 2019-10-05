CREATE TABLE [aes2].[ecs_exp_card3_receipient] (
    [id]                   NUMERIC (19)   NOT NULL,
    [street_and_no]        NVARCHAR (105) NULL,
    [postcode]             NVARCHAR (9)   NULL,
    [city]                 NVARCHAR (105) NULL,
    [name_f]               NVARCHAR (105) NULL,
    [country]              NVARCHAR (2)   NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_card3_receipient$pk_ecs_exp_card3_receipient] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_card3_receipient$fk_card_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

