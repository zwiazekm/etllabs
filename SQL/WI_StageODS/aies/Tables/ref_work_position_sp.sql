CREATE TABLE [aies].[ref_work_position_sp] (
    [id]             NUMERIC (19) NOT NULL,
    [work_season_id] NUMERIC (19) NOT NULL,
    [day_from]       SMALLINT     NOT NULL,
    [day_to]         SMALLINT     NOT NULL,
    [hour_from]      SMALLINT     NOT NULL,
    [hour_to]        SMALLINT     NOT NULL,
    [hour_from2]     SMALLINT     NULL,
    [hour_to2]       SMALLINT     NULL,
    CONSTRAINT [pk_ref_work_position_sp] PRIMARY KEY CLUSTERED ([id] ASC)
);

