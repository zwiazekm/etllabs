CREATE TABLE [aies].[ref_exit_acceptance] (
    [id]         NUMERIC (19)  NOT NULL,
    [slw_id]     NUMERIC (19)  NULL,
    [code]       VARCHAR (8)   NOT NULL,
    [short_name] NVARCHAR (35) NOT NULL,
    [from_date]  DATETIME      NULL,
    [to_date]    DATETIME      NULL,
    CONSTRAINT [pk_ref_exit_acceptance] PRIMARY KEY CLUSTERED ([id] ASC)
);

