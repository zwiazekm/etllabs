CREATE TABLE [zef2].[Komorka] (
    [IDKomorki]                 INT             NOT NULL,
    [NazwaKomorki]              NVARCHAR (500)  NOT NULL,
    [IDTypuKomorki]             INT             NOT NULL,
    [IDKomorkiNadrzednej]       INT             NULL,
    [IDSzefa]                   INT             NULL,
    [Sciezka]                   NVARCHAR (4000) NULL,
    [IDOsobyDomyslnej]          INT             NULL,
    [KodKomorki]                NVARCHAR (20)   NULL,
    [Aktywna]                   BIT             CONSTRAINT [DF_Komorka_Aktywna] DEFAULT ((1)) NOT NULL,
    [FullTextSearch]            AS              ((isnull([KodKomorki]+' ','')+isnull([NazwaKomorki]+' ',''))+isnull([Opis],'')),
    [IDSposobuObslugiPismaP]    INT             CONSTRAINT [DF_Komorka_IDSposobuObslugiPismaP] DEFAULT ((3)) NOT NULL,
    [KodKomorkiZnak]            NVARCHAR (50)   NULL,
    [TylkoSzef]                 BIT             NULL,
    [Opis]                      NVARCHAR (4000) NULL,
    [IdKomorkiKancelaria]       INT             NULL,
    [IDJednostkiOrganizacyjnej] INT             NULL,
    [IdMetadaneObiektu]         INT             NULL,
    CONSTRAINT [PK_Komorka] PRIMARY KEY CLUSTERED ([IDKomorki] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
);


GO
ALTER TABLE [zef2].[Komorka] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

