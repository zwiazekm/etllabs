CREATE TABLE [aies].[ref_place] (
    [id]         NUMERIC (19)  NOT NULL,
    [slw_id]     NUMERIC (19)  NOT NULL,
    [code]       VARCHAR (17)  NOT NULL,
    [short_name] NVARCHAR (35) NOT NULL,
    [from_date]  DATETIME      NULL,
    [to_date]    DATETIME      NULL,
    CONSTRAINT [pk_ref_place] PRIMARY KEY CLUSTERED ([id] ASC)
);

