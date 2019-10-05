CREATE TABLE [aies].[customs_directive_pointer] (
    [id]    NUMERIC (19)   NOT NULL,
    [code]  VARCHAR (4)    NULL,
    [diid]  NUMERIC (19)   NULL,
    [name]  VARCHAR (1024) NULL,
    [type]  INT            NULL,
    [value] VARCHAR (1024) NULL,
    CONSTRAINT [pk_customs_directive_pointer] PRIMARY KEY CLUSTERED ([id] ASC)
);

