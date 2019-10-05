CREATE TABLE [aes2].[customs_operation] (
    [id]                 NUMERIC (19)    NOT NULL,
    [code]               NVARCHAR (255)  NOT NULL,
    [operator]           NVARCHAR (40)   NOT NULL,
    [annotation]         NVARCHAR (3072) NULL,
    [time_op]            DATETIME2 (3)   NOT NULL,
    [decl_id]            NUMERIC (19)    NOT NULL,
    [kind_of_annotation] NVARCHAR (3)    NULL,
    CONSTRAINT [customs_operation2$pk_customs_operation] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [customs_operation2$fk_operation_decl] FOREIGN KEY ([decl_id]) REFERENCES [aes2].[customs_decl] ([id])
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171205-143929]
    ON [aes2].[customs_operation]([time_op] ASC)
    ON [FG_AES2];


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171206-105458]
    ON [aes2].[customs_operation]([decl_id] ASC)
    ON [FG_AES2];

