CREATE TABLE [aies].[ref_work_time_exception] (
    [id]        NUMERIC (19) NOT NULL,
    [slw_id]    NUMERIC (19) NOT NULL,
    [co_code]   VARCHAR (8)  NOT NULL,
    [date_s]    DATETIME     NOT NULL,
    [hour_from] SMALLINT     NULL,
    [hour_to]   SMALLINT     NULL,
    CONSTRAINT [pk_ref_work_time_exception] PRIMARY KEY CLUSTERED ([id] ASC)
);

