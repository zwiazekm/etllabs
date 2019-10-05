CREATE TABLE [aies].[ref_slw_item] (
    [id]          NUMERIC (19)    NOT NULL,
    [code]        VARCHAR (20)    NOT NULL,
    [from_date]   DATETIME        NULL,
    [to_date]     DATETIME        NULL,
    [slw_id]      NUMERIC (19)    NOT NULL,
    [description] NVARCHAR (3072) NULL,
    CONSTRAINT [pk_ref_slw_item] PRIMARY KEY CLUSTERED ([id] ASC)
);

