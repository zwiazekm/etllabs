CREATE TABLE [intr2].[istat_menu] (
    [id]            BIGINT         NOT NULL,
    [parent_id]     BIGINT         NULL,
    [shortname]     NVARCHAR (100) NOT NULL,
    [fullname]      NVARCHAR (255) NULL,
    [target_grid]   NVARCHAR (100) NOT NULL,
    [icon]          NVARCHAR (255) NULL,
    [configuration] NTEXT          NOT NULL,
    [user_name]     NVARCHAR (100) NULL,
    CONSTRAINT [istat_menu$PK_istat_menu] PRIMARY KEY CLUSTERED ([id] ASC)
);

