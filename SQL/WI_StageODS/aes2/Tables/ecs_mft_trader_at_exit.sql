CREATE TABLE [aes2].[ecs_mft_trader_at_exit] (
    [id]               NUMERIC (19)   NOT NULL,
    [street_and_no]    NVARCHAR (105) NULL,
    [postcode]         NVARCHAR (9)   NULL,
    [city]             NVARCHAR (105) NULL,
    [name_f]           NVARCHAR (105) NULL,
    [country]          NVARCHAR (2)   NULL,
    [tin]              NVARCHAR (17)  NULL,
    [manifest_decl_id] NUMERIC (19)   NOT NULL,
    [email]            NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_mft_trader_at_exit$pk_ecs_mft_trader_at_exit] PRIMARY KEY CLUSTERED ([id] ASC)
);

