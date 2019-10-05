CREATE TABLE [ncts2].[ZapytaniaOGwarancje] (
    [Id]                        BIGINT        NOT NULL,
    [DataUtworzenia]            DATETIME      NULL,
    [IdKomunikatZapytania]      BIGINT        NULL,
    [IdKomunikatOdpowiedzi]     BIGINT        NULL,
    [IdKomunikatZapytaniaOSOZ]  BIGINT        NULL,
    [IdKomunikatOdpowiedziOSOZ] BIGINT        NULL,
    [KomunikacjaOdbiorcaNTA]    NVARCHAR (35) NULL,
    [KodUCPytajacego]           NVARCHAR (8)  NULL,
    CONSTRAINT [ZapytaniaOGwarancje_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

