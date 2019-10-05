CREATE TABLE [aes2].[customs_disrepancy] (
    [id]        NUMERIC (19)    NOT NULL,
    [dirt_id]   NUMERIC (19)    NULL,
    [pointer]   NVARCHAR (255)  NULL,
    [was_value] NVARCHAR (1024) NULL,
    [is_value]  NVARCHAR (1024) NULL,
    CONSTRAINT [customs_disrepancy$customs_di_13864849871] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

