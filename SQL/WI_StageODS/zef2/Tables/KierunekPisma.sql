CREATE TABLE [zef2].[KierunekPisma] (
    [IDKierunkuPisma] INT            NOT NULL,
    [KierunekPisma]   NVARCHAR (50)  NULL,
    [UrlNowe]         NVARCHAR (200) NULL,
    [UrlSzczegoly]    NVARCHAR (200) NULL,
    [UrlWyszukiwanie] NVARCHAR (200) NULL,
    [Mapowanie]       NVARCHAR (MAX) NULL,
    [Aktywny]         BIT            NULL,
    [Symbol]          NVARCHAR (5)   NULL,
    [IDTypuPisma]     INT            NULL,
    [IDGrupy]         INT            NULL,
    [UrlEdycja]       NVARCHAR (200) NULL,
    [Opis]            NVARCHAR (500) NULL,
    [WObsluzonych]    BIT            NULL,
    [czyCOW]          BIT            NULL,
    [czyCR]           BIT            NULL,
    [operacja]        NVARCHAR (1)   NULL,
    CONSTRAINT [PK_KierunekPisma] PRIMARY KEY CLUSTERED ([IDKierunkuPisma] ASC) WITH (FILLFACTOR = 90)
);

