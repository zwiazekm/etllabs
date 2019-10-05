CREATE TABLE [aies].[ecs_exp_trader_at_present] (
    [id]                   NUMERIC (19)   NOT NULL,
    [street_and_no]        NVARCHAR (140) NULL,
    [postcode]             VARCHAR (9)    NULL,
    [city]                 NVARCHAR (140) NULL,
    [name_f]               NVARCHAR (140) NULL,
    [country]              VARCHAR (2)    NULL,
    [tin]                  VARCHAR (17)   NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    [eori]                 VARCHAR (17)   NULL,
    [email]                VARCHAR (35)   NULL,
    CONSTRAINT [pk_ecs_exp_trader_at_present] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

