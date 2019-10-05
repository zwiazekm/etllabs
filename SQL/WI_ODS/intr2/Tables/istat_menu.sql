CREATE TABLE [intr2].[istat_menu] (
    [id]            BIGINT         NOT NULL,
    [parent_id]     BIGINT         NULL,
    [shortname]     NVARCHAR (100) NOT NULL,
    [fullname]      NVARCHAR (255) NULL,
    [target_grid]   NVARCHAR (100) NOT NULL,
    [icon]          NVARCHAR (255) NULL,
    [configuration] NTEXT          NOT NULL,
    [user_name]     NVARCHAR (100) NULL,
    CONSTRAINT [istat_menu$PK_istat_menu] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_menu$FK_istat_menu_parent_id_id] FOREIGN KEY ([parent_id]) REFERENCES [intr2].[istat_menu] ([id])
) TEXTIMAGE_ON [FG_INTR2];

