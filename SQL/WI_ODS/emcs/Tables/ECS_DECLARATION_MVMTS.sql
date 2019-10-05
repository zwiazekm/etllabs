﻿CREATE TABLE [emcs].[ECS_DECLARATION_MVMTS] (
    [ID]              BIGINT       NOT NULL,
    [ECSD_ID]         BIGINT       NOT NULL,
    [ARC]             VARCHAR (21) NOT NULL,
    [SEQUENCE_NUMBER] DECIMAL (2)  NULL,
    CONSTRAINT [PK_ECS_DECLARATION_MVMTS] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_EMCS],
    CONSTRAINT [UK_ECS_DECLARATION_MVMTS_1] UNIQUE NONCLUSTERED ([ECSD_ID] ASC, [ARC] ASC) ON [FG_EMCS]
);

