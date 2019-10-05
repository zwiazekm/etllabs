﻿CREATE TABLE [aies].[customs_directive_intr] (
    [id]   NUMERIC (19) NOT NULL,
    [code] VARCHAR (4)  NULL,
    [diid] NUMERIC (19) NULL,
    CONSTRAINT [pk_customs_directive_intr] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

