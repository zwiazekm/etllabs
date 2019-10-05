CREATE TABLE [aies].[ref_work_calendar_sp] (
    [id]      NUMERIC (19) NOT NULL,
    [slw_id]  NUMERIC (19) NULL,
    [co_code] VARCHAR (8)  NOT NULL,
    [YEAR]    SMALLINT     NOT NULL,
    CONSTRAINT [pk_ref_work_calendar_sp] PRIMARY KEY CLUSTERED ([id] ASC)
);

