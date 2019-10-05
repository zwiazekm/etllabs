CREATE TABLE [aes2].[customs_directive_intr] (
    [id]   NUMERIC (19) NOT NULL,
    [code] NVARCHAR (4) NULL,
    [diid] NUMERIC (19) NULL,
    CONSTRAINT [customs_directive_intr$PK_customs_directive_intr] PRIMARY KEY CLUSTERED ([id] ASC)
);

