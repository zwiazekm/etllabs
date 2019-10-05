﻿CREATE TABLE [emcs2].[EMCS_ACO_OUTER_MESSAGES] (
    [ID]         NUMERIC (38) NOT NULL,
    [ACO_ID]     NUMERIC (38) NOT NULL,
    [MESSAGE_ID] NUMERIC (38) NOT NULL,
    [TYPE]       VARCHAR (9)  NOT NULL,
    CONSTRAINT [PK_ACO_OUTER_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

