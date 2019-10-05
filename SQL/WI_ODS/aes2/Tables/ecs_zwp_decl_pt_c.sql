CREATE TABLE [aes2].[ecs_zwp_decl_pt_c] (
    [id]                    NUMERIC (19)   NOT NULL,
    [comment_f]             NVARCHAR (840) NULL,
    [declcopresent_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_decl_pt_c$PK_ecs_zwp_decl_pt_c] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_decl_pt_c$FK_ecs_zwp_decl_pt_c_ecs_zwp_declcopresent] FOREIGN KEY ([declcopresent_decl_id]) REFERENCES [aes2].[ecs_zwp_declcopresent] ([decl_id])
);

