CREATE TABLE [zef2].[formy] (
    [idTech]      BIGINT        NOT NULL,
    [TXT01]       VARCHAR (255) NULL,
    [TXT02]       VARCHAR (255) NULL,
    [dateFrom]    DATETIME2 (7) NULL,
    [dateTo]      DATETIME2 (7) NULL,
    [deleted]     BIT           DEFAULT ((0)) NOT NULL,
    [description] VARCHAR (255) NULL,
    [idBiz]       BIGINT        NULL,
    [idBizParent] BIGINT        NULL,
    [name]        VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([idTech] ASC) ON [FG_ZEF2]
);


GO
ALTER TABLE [zef2].[formy] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

