CREATE TABLE [aies].[customs_directive_change] (
    [id]            NUMERIC (19)   NOT NULL,
    [code]          VARCHAR (4)    NULL,
    [diid]          NUMERIC (19)   NULL,
    [affects]       VARCHAR (30)   NULL,
    [AFTER]         VARCHAR (100)  NULL,
    [justification] VARCHAR (1024) NULL,
    [initial_value] VARCHAR (100)  NULL,
    CONSTRAINT [pk_customs_directive_change] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

