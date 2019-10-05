CREATE TABLE [aies].[customs_change] (
    [id]            NUMERIC (19)   NOT NULL,
    [before_change] NVARCHAR (280) NULL,
    [after_change]  NVARCHAR (280) NULL,
    [item]          VARCHAR (255)  NULL,
    [operation_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_customs_change] PRIMARY KEY CLUSTERED ([id] ASC)
);

