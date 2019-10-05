CREATE TABLE [zc].[DPDZ_Dokument] (
    [IdDok]                BIGINT          NOT NULL,
    [RodzajDok]            VARCHAR (4)     NULL,
    [Identyfikator]        VARCHAR (40)    NULL,
    [WersjaXML]            VARCHAR (7)     NULL,
    [DataPrzeslania]       DATETIME        NULL,
    [UrzadRejestracji]     VARCHAR (8)     NULL,
    [UrzadRejestracjiPid]  INT             NULL,
    [PasRejestracji]       CHAR (2)        NULL,
    [Status]               CHAR (1)        NULL,
    [DataZlozeniaPac]      DATETIME        NULL,
    [Placowka]             VARCHAR (8)     NULL,
    [PlacowkaPid]          INT             NULL,
    [NrCelina]             VARCHAR (40)    NULL,
    [DataPrzyjecia]        DATETIME        NULL,
    [Zefir]                CHAR (1)        NULL,
    [ZwolnienieTowaru]     CHAR (1)        NULL,
    [Wykaz]                VARCHAR (30)    NULL,
    [PotwierdzenieWywozu]  CHAR (1)        NULL,
    [PozycjaWykazu]        INT             NULL,
    [NrCelina2]            VARCHAR (40)    NULL,
    [TypDok]               CHAR (2)        NULL,
    [RejestrDluguCelnego]  VARCHAR (20)    NULL,
    [LiczbaPozycji]        SMALLINT        NULL,
    [LiczbaOpakowan]       INT             NULL,
    [MasaBrutto]           DECIMAL (14, 3) NULL,
    [KrajWysylki]          CHAR (2)        NULL,
    [KrajWysylkiPid]       INT             NULL,
    [KrajPrzeznaczenia]    CHAR (2)        NULL,
    [KrajPrzeznaczeniaPid] INT             NULL,
    [LokalizacjaMiejsce]   VARCHAR (17)    NULL,
    [LokalizacjaUC]        VARCHAR (8)     NULL,
    [LokalizacjaUCPid]     INT             NULL,
    [LokalizacjaOpis]      VARCHAR (35)    NULL,
    [Waluta]               CHAR (3)        NULL,
    [WalutaPid]            INT             NULL,
    [Wartosc]              DECIMAL (17, 2) NULL,
    [KursWaluty]           DECIMAL (10, 4) NULL,
    [Miejsce]              VARCHAR (35)    NULL,
    [Data]                 DATETIME        NULL,
    [IdSkladajacy]         INT             NULL,
    [IdZglaszajacy]        INT             NULL,
    CONSTRAINT [PK_DPDZ_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_IdSkladajacy_DPDZ_Skladajacy_idSkladajacy] FOREIGN KEY ([IdSkladajacy]) REFERENCES [zc].[DPDZ_Skladajacy] ([idSkladajacy]),
    CONSTRAINT [FK_DPDZ_Dokument_IdZglaszajacy_DPDZ_Kontrahent_idKontrahenta] FOREIGN KEY ([IdZglaszajacy]) REFERENCES [zc].[DPDZ_Kontrahent] ([idKontrahenta]),
    CONSTRAINT [FK_DPDZ_Dokument_KrajPrzeznaczeniaPid] FOREIGN KEY ([KrajPrzeznaczeniaPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_DPDZ_Dokument_KrajWysylkiPid] FOREIGN KEY ([KrajWysylkiPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_DPDZ_Dokument_LokalizacjaUCPid] FOREIGN KEY ([LokalizacjaUCPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DPDZ_Dokument_PlacowkaPid] FOREIGN KEY ([PlacowkaPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DPDZ_Dokument_UrzadRejestracjiPid] FOREIGN KEY ([UrzadRejestracjiPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DPDZ_Dokument_WalutaPid] FOREIGN KEY ([WalutaPid]) REFERENCES [pdr].[s026] ([s026_id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DPDZ_Dokument_KrajWysylkiPid]
    ON [zc].[DPDZ_Dokument]([KrajWysylkiPid] ASC)
    ON [FG_ZC];


GO
CREATE NONCLUSTERED INDEX [IX_DPDZ_Dokument_UrzadRejestracji]
    ON [zc].[DPDZ_Dokument]([UrzadRejestracji] ASC)
    ON [FG_ZC];


GO
CREATE NONCLUSTERED INDEX [IX_DPDZ_Dokument_UrzadRejestracjiPid]
    ON [zc].[DPDZ_Dokument]([UrzadRejestracjiPid] ASC)
    ON [FG_ZC];


GO
CREATE NONCLUSTERED INDEX [IX_DPDZ_Dokument_WalutaPid]
    ON [zc].[DPDZ_Dokument]([WalutaPid] ASC)
    ON [FG_ZC];

