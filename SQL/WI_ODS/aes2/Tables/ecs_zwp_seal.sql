CREATE TABLE [aes2].[ecs_zwp_seal] (
    [id]                    NUMERIC (19)   NOT NULL,
    [identity_f]            NVARCHAR (120) NULL,
    [declcopresent_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_seal$PK_ecs_zwp_seal] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_seal$FK_ecs_zwp_seal_ecs_zwp_declcopresent] FOREIGN KEY ([declcopresent_decl_id]) REFERENCES [aes2].[ecs_zwp_declcopresent] ([decl_id])
);

