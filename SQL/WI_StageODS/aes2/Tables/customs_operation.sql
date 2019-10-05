CREATE TABLE [aes2].[customs_operation] (
    [id]                 NUMERIC (19)    NOT NULL,
    [code]               NVARCHAR (255)  NOT NULL,
    [operator]           NVARCHAR (40)   NOT NULL,
    [annotation]         NVARCHAR (3072) NULL,
    [time_op]            DATETIME2 (3)   NOT NULL,
    [decl_id]            NUMERIC (19)    NOT NULL,
    [kind_of_annotation] NVARCHAR (3)    NULL,
    CONSTRAINT [customs_operation$pk_customs_operation] PRIMARY KEY CLUSTERED ([id] ASC)
);

