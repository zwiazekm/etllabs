CREATE TABLE [her].[ka_dp020] (
    [RV]                BINARY (8)  NULL,
    [DataZap]           DATETIME    NULL,
    [IdUzZap]           INT         NULL,
    [IdDp020]           INT         NOT NULL,
    [IdPrac]            INT         NOT NULL,
    [IdUmowy]           INT         NOT NULL,
    [DataOd]            DATETIME    NULL,
    [KodGrPrac]         VARCHAR (9) NULL,
    [IdKodGrPrac]       INT         NULL,
    [IdPracodawca]      INT         NULL,
    [IdJednOrg]         INT         NOT NULL,
    [IdKomOrg]          INT         NOT NULL,
    [IdStanEtat]        INT         NOT NULL,
    [IdKomOrgMian]      INT         NULL,
    [IdStan]            INT         NULL,
    [KodPowZmianStan]   VARCHAR (9) NULL,
    [IdKodPowZmianStan] INT         NULL,
    [WskZmianStrOrg]    BIT         NULL,
    [KodPodstPraw]      VARCHAR (9) NULL,
    [IdKodPodstPraw]    INT         NULL,
    CONSTRAINT [PK_ka_dp020_IdDp020] PRIMARY KEY CLUSTERED ([IdDp020] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp020_IdJednOrg_ad_kat_org_iduni] FOREIGN KEY ([IdJednOrg]) REFERENCES [her].[ad_kat_org] ([iduni]),
    CONSTRAINT [FK_ka_dp020_IdKodGrPrac_ka_dp25_id] FOREIGN KEY ([IdKodGrPrac]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020_IdKodPodstPraw_ka_dp25_id] FOREIGN KEY ([IdKodPodstPraw]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020_IdKodPowZmianStan_ka_dp25_id] FOREIGN KEY ([IdKodPowZmianStan]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020_IdKomOrg_ad_kat_org_iduni] FOREIGN KEY ([IdKomOrg]) REFERENCES [her].[ad_kat_org] ([iduni]),
    CONSTRAINT [FK_ka_dp020_IdKomOrgMian_ad_kat_org_iduni] FOREIGN KEY ([IdKomOrgMian]) REFERENCES [her].[ad_kat_org] ([iduni]),
    CONSTRAINT [FK_ka_dp020_IdPrac_ka_dp001_IdPrac] FOREIGN KEY ([IdPrac]) REFERENCES [her].[ka_dp001] ([IdPrac]),
    CONSTRAINT [FK_ka_dp020_IdStanEtat_ad_org_etat_id] FOREIGN KEY ([IdStanEtat]) REFERENCES [her].[ad_org_etat] ([id]),
    CONSTRAINT [FK_ka_dp020_IdUmowy_ka_dp002_IdUmowy] FOREIGN KEY ([IdUmowy]) REFERENCES [her].[ka_dp002] ([IdUmowy])
);


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp020_IdPrac]
    ON [her].[ka_dp020]([IdPrac] ASC)
    ON [FG_HER];


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp020_IdPrac_IdUmowy]
    ON [her].[ka_dp020]([IdPrac] ASC, [IdUmowy] ASC)
    ON [FG_HER];


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp020_IdUmowy]
    ON [her].[ka_dp020]([IdUmowy] ASC)
    ON [FG_HER];

