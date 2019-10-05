﻿CREATE TABLE [emcs].[MESSAGE_TYPES] (
    [MESSAGE_TYPE] VARCHAR (32) NOT NULL,
    [DESCRIPTION]  VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_MESSAGE_TYPES] PRIMARY KEY CLUSTERED ([MESSAGE_TYPE] ASC)
);

