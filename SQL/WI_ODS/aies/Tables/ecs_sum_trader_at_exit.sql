CREATE TABLE [aies].[ecs_sum_trader_at_exit] (
    [id]            NUMERIC (19)  NOT NULL,
    [street_and_no] VARCHAR (255) NULL,
    [postcode]      VARCHAR (255) NULL,
    [city]          VARCHAR (255) NULL,
    [name_f]        VARCHAR (255) NULL,
    [country]       VARCHAR (255) NULL,
    [tin]           VARCHAR (255) NULL,
    [eori]          VARCHAR (17)  NULL,
    [exs_id]        NUMERIC (19)  NULL,
    [return_email]  VARCHAR (80)  NULL,
    [email]         VARCHAR (35)  NULL,
    CONSTRAINT [ecs_sum_tr_9134352971] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

