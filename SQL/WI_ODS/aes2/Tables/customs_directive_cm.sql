CREATE TABLE [aes2].[customs_directive_cm] (
    [directive_id] NUMERIC (19)  NOT NULL,
    [code]         NVARCHAR (10) NOT NULL,
    CONSTRAINT [customs_directive_control_method$PK_customs_directive_control_method] PRIMARY KEY CLUSTERED ([directive_id] ASC, [code] ASC) ON [FG_AES2],
    CONSTRAINT [customs_directive_control_method$FK_customs_directive_control_method__customs_directive] FOREIGN KEY ([directive_id]) REFERENCES [aes2].[customs_directive] ([id])
);

