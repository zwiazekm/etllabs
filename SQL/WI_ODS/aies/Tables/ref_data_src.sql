CREATE TABLE [aies].[ref_data_src] (
    [ref_data_class_id] NUMERIC (19) NOT NULL,
    [source]            TEXT         NOT NULL,
    CONSTRAINT [pk_ref_data_src] PRIMARY KEY CLUSTERED ([ref_data_class_id] ASC) ON [FG_AIES]
) TEXTIMAGE_ON [FG_AIES];

