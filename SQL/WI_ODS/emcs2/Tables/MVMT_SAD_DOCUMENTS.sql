﻿CREATE TABLE [emcs2].[MVMT_SAD_DOCUMENTS] (
    [ID]         NUMERIC (38)  NOT NULL,
    [SAD_NUMBER] NVARCHAR (63) NOT NULL,
    [MVMT_ID]    NUMERIC (38)  NOT NULL,
    CONSTRAINT [PK_MVMTSAD] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_MVMTSAD_MVMT] FOREIGN KEY ([MVMT_ID]) REFERENCES [emcs2].[MOVEMENTS] ([ID])
);

