CREATE TABLE [aes2].[ecs_los_declarant] (
    [id]                    NUMERIC (19)   NOT NULL,
    [city]                  NVARCHAR (255) NULL,
    [country]               NVARCHAR (255) NULL,
    [name_f]                NVARCHAR (255) NULL,
    [postcode]              NVARCHAR (255) NULL,
    [street_and_no]         NVARCHAR (255) NULL,
    [tin]                   NVARCHAR (255) NULL,
    [losdeclcoexit_decl_id] NUMERIC (19)   NULL,
    [email]                 NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_los_declarant$ecs_los_de_20438673171] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_los_declarant$fk_declarant_losdecl_co_exit] FOREIGN KEY ([losdeclcoexit_decl_id]) REFERENCES [aes2].[ecs_los_declcoexit] ([decl_id])
);

