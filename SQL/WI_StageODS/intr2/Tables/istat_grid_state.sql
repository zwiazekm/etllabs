CREATE TABLE [intr2].[istat_grid_state] (
    [id]            BIGINT         NOT NULL,
    [user_name]     NVARCHAR (100) NOT NULL,
    [grid_name]     NVARCHAR (100) NULL,
    [configuration] NTEXT          NOT NULL,
    CONSTRAINT [istat_grid_state$PK_istat_grid_state] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [istat_grid_state$UQ_istat_grid_state] UNIQUE NONCLUSTERED ([user_name] ASC, [grid_name] ASC)
);

