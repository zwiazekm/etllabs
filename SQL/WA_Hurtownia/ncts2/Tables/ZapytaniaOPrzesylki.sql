CREATE TABLE [ncts2].[ZapytaniaOPrzesylki] (
    [Id]                              BIGINT         NOT NULL,
    [MRN]                             NVARCHAR (18)  NULL,
    [DataUtworzenia]                  DATETIME       NULL,
    [DataOdpowiedzi]                  DATETIME       NULL,
    [StatusOdpowiedzi]                NVARCHAR (3)   NULL,
    [IdUzytkownika]                   BIGINT         NULL,
    [UCPrzedstawieniaZapytania]       NVARCHAR (8)   NULL,
    [UCWyslaniaZapytania ]            NVARCHAR (8)   NULL,
    [IdKomunikatuZapytaniaIE027]      BIGINT         NULL,
    [IdKomunikatuOdpowiedziIE038]     BIGINT         NULL,
    [ZapytanieDodatkInformOPrzesylce] NVARCHAR (140) NULL,
    [OdpowiedzDodatkInformOPrzesylce] NVARCHAR (140) NULL,
    [PoinformowanoOPrzeladunku]       BIT            NULL,
    [PoinformowanoOZdarzeniu]         BIT            NULL,
    CONSTRAINT [ZapytaniaOPrzesylki_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

