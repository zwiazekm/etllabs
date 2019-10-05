CREATE TABLE [aes2].[customs_directive_pointer] (
    [id]    NUMERIC (19)    NOT NULL,
    [code]  NVARCHAR (4)    NULL,
    [diid]  NUMERIC (19)    NULL,
    [name]  NVARCHAR (1024) NULL,
    [type]  INT             NULL,
    [value] NVARCHAR (1024) NULL,
    CONSTRAINT [customs_directive_pointer$PK_customs_directive_pointer] PRIMARY KEY CLUSTERED ([id] ASC)
);

