CREATE TABLE [aes2].[ecs_exp_stat_requ] (
    [id]        NUMERIC (19)  NOT NULL,
    [requ_date] DATETIME2 (3) NULL,
    [requ_sref] NVARCHAR (22) NULL,
    [resp_date] DATETIME2 (3) NULL,
    [resp_resu] NVARCHAR (3)  NULL,
    [resp_sref] NVARCHAR (22) NULL,
    [decl_id]   NUMERIC (19)  NULL,
    CONSTRAINT [ecs_exp_stat_requ$ecs_exp_st_14921973352] PRIMARY KEY CLUSTERED ([id] ASC)
);

