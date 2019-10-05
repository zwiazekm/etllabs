CREATE TABLE [aies].[ref_holiday] (
    [id]        NUMERIC (19) NOT NULL,
    [slw_id]    NUMERIC (19) NOT NULL,
    [moving]    TINYINT      NOT NULL,
    [YEAR]      SMALLINT     NULL,
    [MONTH]     TINYINT      NOT NULL,
    [DAY]       TINYINT      NOT NULL,
    [from_date] DATETIME     NULL,
    [to_date]   DATETIME     NULL,
    CONSTRAINT [pk_ref_holiday] PRIMARY KEY CLUSTERED ([id] ASC)
);

