CREATE TABLE [aes2].[customs_directive_intr] (
    [id]   NUMERIC (19) NOT NULL,
    [code] NVARCHAR (4) NULL,
    [diid] NUMERIC (19) NULL,
    CONSTRAINT [customs_directive_intr$PK_customs_directive_intr] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [customs_directive_intr$FK_customs_directive_intr_customs_directive] FOREIGN KEY ([diid]) REFERENCES [aes2].[customs_directive] ([id])
);

