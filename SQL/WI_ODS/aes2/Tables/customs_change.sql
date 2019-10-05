CREATE TABLE [aes2].[customs_change] (
    [id]            NUMERIC (19)   NOT NULL,
    [before_change] NVARCHAR (840) NULL,
    [after_change]  NVARCHAR (840) NULL,
    [item]          NVARCHAR (255) NULL,
    [operation_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [customs_change$pk_customs_change] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [customs_change$fk_change_operation] FOREIGN KEY ([operation_id]) REFERENCES [aes2].[customs_operation] ([id])
);

