﻿CREATE TABLE [pdr].[c4001_uprawnienia] (
    [c4001_uprawnienia_id]   BIGINT       NOT NULL,
    [rodzajuprawnienia]      VARCHAR (1)  NULL,
    [uprawnienie]            VARCHAR (50) NULL,
    [c4001_reprezentacje_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4001_uprawnienia_id] ASC)
);

