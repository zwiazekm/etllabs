CREATE TABLE [aies].[ecs_exp_consignee_of_item] (
    [id]            NUMERIC (19)  NOT NULL,
    [street_and_no] NVARCHAR (35) NULL,
    [postcode]      VARCHAR (9)   NULL,
    [city]          NVARCHAR (35) NULL,
    [name_f]        NVARCHAR (35) NULL,
    [country]       VARCHAR (2)   NULL,
    [tin]           VARCHAR (17)  NULL,
    [regon]         VARCHAR (14)  NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [eori]          VARCHAR (17)  NULL,
    [email]         VARCHAR (35)  NULL,
    CONSTRAINT [pk_ecs_exp_consignee_of_item] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

