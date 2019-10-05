CREATE TABLE [aies].[sec_groups] (
    [id]       NUMERIC (19) NOT NULL,
    [grp_code] VARCHAR (40) NOT NULL,
    [app_code] VARCHAR (20) NULL,
    [grp_name] VARCHAR (40) NOT NULL,
    [profil]   TINYINT      NULL,
    CONSTRAINT [pk_sec_groups] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

