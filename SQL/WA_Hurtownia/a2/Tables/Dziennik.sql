CREATE TABLE [a2].[Dziennik] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [SPID]            SMALLINT        NOT NULL,
    [Data]            DATETIME        NOT NULL,
    [Status]          CHAR (1)        NOT NULL,
    [ContextInfo]     VARBINARY (128) NULL,
    [Poziom]          TINYINT         DEFAULT ((0)) NULL,
    [Procedura]       INT             NULL,
    [Informacja]      VARCHAR (1900)  NULL,
    [CzasWykonaniaMs] INT             NULL,
    [RowCnt]          INT             NULL,
    CONSTRAINT [PK_Dziennik] PRIMARY KEY CLUSTERED ([Id] ASC)
);

