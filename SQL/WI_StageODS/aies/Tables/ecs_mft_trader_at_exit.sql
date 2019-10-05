CREATE TABLE [aies].[ecs_mft_trader_at_exit] (
    [id]               NUMERIC (19)  NOT NULL,
    [street_and_no]    NVARCHAR (35) NULL,
    [postcode]         VARCHAR (9)   NULL,
    [city]             NVARCHAR (35) NULL,
    [name_f]           NVARCHAR (35) NULL,
    [country]          VARCHAR (2)   NULL,
    [tin]              VARCHAR (17)  NULL,
    [manifest_decl_id] NUMERIC (19)  NOT NULL,
    [email]            VARCHAR (35)  NULL,
    CONSTRAINT [pk_ecs_mft_trader_at_exit] PRIMARY KEY CLUSTERED ([id] ASC)
);

