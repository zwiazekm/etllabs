﻿CREATE TABLE [aes2].[customs_directive_indicator] (
    [ID]           NUMERIC (19)   NOT NULL,
    [DIRECTIVE_ID] NUMERIC (19)   NOT NULL,
    [NAME]         NVARCHAR (100) NOT NULL,
    [VALUE]        NVARCHAR (100) NULL,
    [show]         BIT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [customs_directive_indicator$customs_di_5127178481] PRIMARY KEY CLUSTERED ([ID] ASC)
);

