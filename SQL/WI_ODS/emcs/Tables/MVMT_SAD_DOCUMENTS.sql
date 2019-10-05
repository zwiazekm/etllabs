﻿CREATE TABLE [emcs].[MVMT_SAD_DOCUMENTS] (
    [ID]         BIGINT        NOT NULL,
    [SAD_NUMBER] NVARCHAR (21) NOT NULL,
    [MVMT_ID]    BIGINT        NOT NULL,
    CONSTRAINT [PK_MVMTSAD] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_EMCS]
);

