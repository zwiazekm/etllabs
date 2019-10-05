CREATE TABLE [aies].[ecs_exp_stat_requ] (
    [id]        NUMERIC (19) NOT NULL,
    [requ_date] DATETIME     NULL,
    [requ_sref] VARCHAR (22) NULL,
    [resp_date] DATETIME     NULL,
    [resp_resu] VARCHAR (3)  NULL,
    [resp_sref] VARCHAR (22) NULL,
    [decl_id]   NUMERIC (19) NULL,
    CONSTRAINT [ecs_exp_st_14921973352] PRIMARY KEY CLUSTERED ([id] ASC)
);

