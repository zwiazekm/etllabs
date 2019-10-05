CREATE TABLE [aes2].[ecs_exp_prev_doc_proc_gosp] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [type]          NVARCHAR (6)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_exp_prev_doc_proc_gosp$ecs_exp_pr_5746220592] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

