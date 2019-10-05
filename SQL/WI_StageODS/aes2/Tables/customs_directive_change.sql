CREATE TABLE [aes2].[customs_directive_change] (
    [id]            NUMERIC (19)    NOT NULL,
    [code]          NVARCHAR (4)    NULL,
    [diid]          NUMERIC (19)    NULL,
    [affects]       NVARCHAR (30)   NULL,
    [after]         NVARCHAR (100)  NULL,
    [justification] NVARCHAR (1024) NULL,
    [initial_value] NVARCHAR (100)  NULL,
    CONSTRAINT [customs_directive_change$PK_customs_directive_change] PRIMARY KEY CLUSTERED ([id] ASC)
);

