CREATE TABLE [aies].[ref_slw] (
    [id]      NUMERIC (19) NOT NULL,
    [version] INT          NOT NULL,
    [code]    VARCHAR (3)  NOT NULL,
    [type]    VARCHAR (10) DEFAULT ('simple') NOT NULL,
    [dts]     CHAR (1)     DEFAULT ('C') NOT NULL,
    CONSTRAINT [pk_ref_slw] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

