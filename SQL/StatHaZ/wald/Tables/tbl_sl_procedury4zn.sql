CREATE TABLE [wald].[tbl_sl_procedury4zn] (
    [kod]         VARCHAR (10)   NOT NULL,
    [opis]        NVARCHAR (300) NULL,
    [pochodzenie] VARCHAR (50)   NULL,
    CONSTRAINT [IX_tbl_sl_procedury4zn] UNIQUE NONCLUSTERED ([kod] ASC) ON [WaldDane]
) ON [WaldDane];

