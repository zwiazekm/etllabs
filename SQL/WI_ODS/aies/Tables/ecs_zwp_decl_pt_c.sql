CREATE TABLE [aies].[ecs_zwp_decl_pt_c] (
    [id]                    NUMERIC (19)   NOT NULL,
    [comment_f]             NVARCHAR (280) NULL,
    [declcopresent_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_zwp_decl_pt_c] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

