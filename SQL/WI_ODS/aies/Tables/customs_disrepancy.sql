CREATE TABLE [aies].[customs_disrepancy] (
    [id]        NUMERIC (19)   NOT NULL,
    [dirt_id]   NUMERIC (19)   NULL,
    [pointer]   VARCHAR (255)  NULL,
    [was_value] VARCHAR (1024) NULL,
    [is_value]  VARCHAR (1024) NULL,
    CONSTRAINT [customs_di_13864849871] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

