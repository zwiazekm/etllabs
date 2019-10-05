CREATE TABLE [dsc].[StatusZatrudnienia] (
    [IDKodStatusZatrudnienia] INT           NOT NULL,
    [KodStatusZatrudnienia]   CHAR (3)      NOT NULL,
    [NazwaStatusZatrudnienia] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_StatusZatrudnienia] PRIMARY KEY CLUSTERED ([IDKodStatusZatrudnienia] ASC)
);

