CREATE TABLE [zef2].[rodzaj_deklaracji] (
    [idTech]      BIGINT        NOT NULL,
    [TXT01]       VARCHAR (255) NULL,
    [TXT02]       VARCHAR (255) NULL,
    [dateFrom]    DATETIME2 (7) NULL,
    [dateTo]      DATETIME2 (7) NULL,
    [deleted]     BIT           NULL,
    [description] VARCHAR (255) NULL,
    [idBiz]       BIGINT        NULL,
    [idBizParent] BIGINT        NULL,
    [name]        VARCHAR (255) NULL,
    [operacja]    NVARCHAR (1)  NULL,
    PRIMARY KEY CLUSTERED ([idTech] ASC)
);

