CREATE TABLE [her].[ka_dp002] (
    [RV]                BINARY (8)     NULL,
    [DataZap]           DATETIME       NULL,
    [IdUzZap]           INT            NULL,
    [IdPrac]            INT            NOT NULL,
    [IdUmowy]           INT            NOT NULL,
    [IdUmowyPowiaz]     INT            NULL,
    [NrKolUmowy]        INT            NULL,
    [NrUmowy]           VARCHAR (10)   NULL,
    [NrAkt]             VARCHAR (10)   NULL,
    [IdKodEp]           INT            NOT NULL,
    [IdPracodawca]      INT            NULL,
    [KodRodzStosPrac]   VARCHAR (9)    NULL,
    [IdKodRodzStosPrac] INT            NOT NULL,
    [KodRodzUmowy]      VARCHAR (9)    NULL,
    [IdKodRodzUmowy]    INT            NOT NULL,
    [KodSposPrzyj]      VARCHAR (9)    NULL,
    [IdKodSposPrzyj]    INT            NULL,
    [KodStatusPrzyj]    VARCHAR (9)    NULL,
    [IdKodStatusPrzyj]  INT            NULL,
    [KodStatusCzKSC]    VARCHAR (9)    NULL,
    [IdKodStatusCzKSC]  INT            NULL,
    [DataZawUmowy]      DATETIME       NOT NULL,
    [DataRozpPracy]     DATETIME       NULL,
    [DataZakUmowy]      DATETIME       NULL,
    [DataOkrUmowyOd]    DATETIME       NULL,
    [DataOkrUmowyDo]    DATETIME       NULL,
    [DataMianSluzbSC]   DATETIME       NULL,
    [KodZwol]           VARCHAR (9)    NULL,
    [IdKodZwol]         INT            NULL,
    [KodPowZwol]        VARCHAR (9)    NULL,
    [IdKodPowZwol]      INT            NULL,
    [MiejWykPracy]      VARCHAR (1000) NULL,
    [WarunkiZatr]       VARCHAR (1000) NULL,
    [WskPrzejNaEmeryt]  BIT            NULL,
    [WskPrzywDoPracy]   BIT            NULL,
    [ZalDoStazuMcy]     SMALLINT       NULL,
    [ZalDoStazuDni]     SMALLINT       NULL,
    CONSTRAINT [PK_ka_dp002_IdUmowy] PRIMARY KEY CLUSTERED ([IdUmowy] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp002_IdKodEp_ka_sl001_IdKodEp] FOREIGN KEY ([IdKodEp]) REFERENCES [her].[ka_sl001] ([IdKodEp]),
    CONSTRAINT [FK_ka_dp002_IdKodPowZwol_ka_dp25_id] FOREIGN KEY ([IdKodPowZwol]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodRodzStosPrac_ka_dp25_id] FOREIGN KEY ([IdKodRodzStosPrac]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodRodzUmowy_ka_dp25_id] FOREIGN KEY ([IdKodRodzUmowy]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodSposPrzyj_ka_dp25_id] FOREIGN KEY ([IdKodSposPrzyj]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodStatusCzKSC_ka_dp25_id] FOREIGN KEY ([IdKodStatusCzKSC]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodStatusPrzyj_ka_dp25_id] FOREIGN KEY ([IdKodStatusPrzyj]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdKodZwol_ka_dp25_id] FOREIGN KEY ([IdKodZwol]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp002_IdPrac_ka_dp001_IdPrac] FOREIGN KEY ([IdPrac]) REFERENCES [her].[ka_dp001] ([IdPrac]),
    CONSTRAINT [FK_ka_dp002_IdUmowyPowiaz_ka_dp002_IdUmowy] FOREIGN KEY ([IdUmowyPowiaz]) REFERENCES [her].[ka_dp002] ([IdUmowy])
);


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp002_DataRozpPracy]
    ON [her].[ka_dp002]([DataRozpPracy] ASC)
    ON [FG_HER];


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp002_DataZakUmowy]
    ON [her].[ka_dp002]([DataZakUmowy] ASC)
    ON [FG_HER];


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp002_DataZawUmowy]
    ON [her].[ka_dp002]([DataZawUmowy] ASC)
    ON [FG_HER];


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp002_IdPrac]
    ON [her].[ka_dp002]([IdPrac] ASC)
    ON [FG_HER];

