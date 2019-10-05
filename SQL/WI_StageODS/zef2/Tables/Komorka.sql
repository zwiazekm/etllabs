CREATE TABLE [zef2].[Komorka] (
    [IDKomorki]                 INT             NOT NULL,
    [NazwaKomorki]              NVARCHAR (500)  NULL,
    [IDTypuKomorki]             INT             NULL,
    [IDKomorkiNadrzednej]       INT             NULL,
    [IDSzefa]                   INT             NULL,
    [Sciezka]                   NVARCHAR (4000) NULL,
    [IDOsobyDomyslnej]          INT             NULL,
    [KodKomorki]                NVARCHAR (20)   NULL,
    [Aktywna]                   BIT             NULL,
    [FullTextSearch]            NVARCHAR (4000) NULL,
    [IDSposobuObslugiPismaP]    INT             NULL,
    [KodKomorkiZnak]            NVARCHAR (50)   NULL,
    [TylkoSzef]                 BIT             NULL,
    [Opis]                      NVARCHAR (4000) NULL,
    [IdKomorkiKancelaria]       INT             NULL,
    [IDJednostkiOrganizacyjnej] INT             NULL,
    [IdMetadaneObiektu]         INT             NULL,
    [operacja]                  NVARCHAR (1)    NULL,
    CONSTRAINT [PK_Komorka] PRIMARY KEY CLUSTERED ([IDKomorki] ASC) WITH (FILLFACTOR = 90)
);

