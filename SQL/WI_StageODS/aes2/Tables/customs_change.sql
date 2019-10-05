CREATE TABLE [aes2].[customs_change] (
    [id]            NUMERIC (19)   NOT NULL,
    [before_change] NVARCHAR (840) NULL,
    [after_change]  NVARCHAR (840) NULL,
    [item]          NVARCHAR (255) NULL,
    [operation_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [customs_change$pk_customs_change] PRIMARY KEY CLUSTERED ([id] ASC)
);

