CREATE TABLE [aies].[customs_operation] (
    [id]                 NUMERIC (19)    NOT NULL,
    [code]               VARCHAR (255)   NOT NULL,
    [operator]           VARCHAR (40)    NOT NULL,
    [annotation]         NVARCHAR (1024) NULL,
    [time_op]            DATETIME        NOT NULL,
    [decl_id]            NUMERIC (19)    NOT NULL,
    [kind_of_annotation] VARCHAR (3)     NULL,
    CONSTRAINT [pk_customs_operation] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

