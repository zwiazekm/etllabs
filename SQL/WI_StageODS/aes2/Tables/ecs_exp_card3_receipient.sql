CREATE TABLE [aes2].[ecs_exp_card3_receipient] (
    [id]                   NUMERIC (19)   NOT NULL,
    [street_and_no]        NVARCHAR (105) NULL,
    [postcode]             NVARCHAR (9)   NULL,
    [city]                 NVARCHAR (105) NULL,
    [name_f]               NVARCHAR (105) NULL,
    [country]              NVARCHAR (2)   NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_card3_receipient$pk_ecs_exp_card3_receipient] PRIMARY KEY CLUSTERED ([id] ASC)
);

