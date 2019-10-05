CREATE TABLE [zef2].[KierunekPisma] (
    [IDKierunkuPisma] INT            NOT NULL,
    [KierunekPisma]   NVARCHAR (50)  NOT NULL,
    [UrlNowe]         NVARCHAR (200) NULL,
    [UrlSzczegoly]    NVARCHAR (200) NULL,
    [UrlWyszukiwanie] NVARCHAR (200) NULL,
    [Mapowanie]       NVARCHAR (MAX) NULL,
    [Aktywny]         BIT            NOT NULL,
    [Symbol]          NVARCHAR (5)   NULL,
    [IDTypuPisma]     INT            NULL,
    [IDGrupy]         INT            NULL,
    [UrlEdycja]       NVARCHAR (200) NULL,
    [Opis]            NVARCHAR (500) NULL,
    [WObsluzonych]    BIT            DEFAULT ((1)) NOT NULL,
    [czyCOW]          BIT            DEFAULT ((0)) NOT NULL,
    [czyCR]           BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_KierunekPisma] PRIMARY KEY CLUSTERED ([IDKierunkuPisma] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
) TEXTIMAGE_ON [FG_ZEF2];


GO
ALTER TABLE [zef2].[KierunekPisma] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

