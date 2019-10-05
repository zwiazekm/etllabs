CREATE TABLE [pdr].[c3014] (
    [c3014_id]             INT          NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [kod]                  VARCHAR (10) NOT NULL,
    [last_modification_tm] DATETIME     NULL,
    [nazwa]                TEXT         NOT NULL,
    [valid_from]           DATE         NOT NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NOT NULL,
    [zablokowane]          INT          NULL,
    PRIMARY KEY CLUSTERED ([c3014_id] ASC)
);

