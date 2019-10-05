CREATE TABLE [aies].[ref_work_season] (
    [id]               NUMERIC (19)  NOT NULL,
    [work_calendar_id] NUMERIC (19)  NOT NULL,
    [season_no]        TINYINT       NOT NULL,
    [name_f]           NVARCHAR (35) NULL,
    [from_date]        DATETIME      NOT NULL,
    [to_date]          DATETIME      NOT NULL,
    CONSTRAINT [pk_ref_work_season] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

