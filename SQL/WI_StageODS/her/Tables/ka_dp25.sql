﻿CREATE TABLE [her].[ka_dp25] (
    [id]         INT           NOT NULL,
    [tr]         SMALLINT      NOT NULL,
    [kod]        VARCHAR (9)   NOT NULL,
    [skrot]      VARCHAR (100) NOT NULL,
    [nazwa]      VARCHAR (100) NOT NULL,
    [nazwa1]     VARCHAR (66)  NULL,
    [nazwa2]     VARCHAR (66)  NULL,
    [nazwa3]     VARCHAR (66)  NULL,
    [nazwa4]     VARCHAR (66)  NULL,
    [nazwa5]     VARCHAR (66)  NULL,
    [nazwa6]     VARCHAR (66)  NULL,
    [nazwap]     VARCHAR (500) NOT NULL,
    [wsk]        VARCHAR (100) NULL,
    [zastrz]     INT           NULL,
    [wsk1]       VARCHAR (100) NULL,
    [wsk2]       VARCHAR (100) NULL,
    [wsk3]       VARCHAR (100) NULL,
    [wsk_arch]   VARCHAR (3)   NULL,
    [wsk_tr]     INT           NULL,
    [wsk_kod]    VARCHAR (250) NULL,
    [wsk_nr_kol] INT           NULL,
    CONSTRAINT [PK_ka_dp25] PRIMARY KEY CLUSTERED ([tr] ASC, [kod] ASC)
);

