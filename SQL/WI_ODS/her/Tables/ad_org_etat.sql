CREATE TABLE [her].[ad_org_etat] (
    [id]                INT             NOT NULL,
    [kat]               SMALLINT        NULL,
    [idwlas]            INT             NULL,
    [idstan]            INT             NULL,
    [il_etat]           DECIMAL (19, 5) NULL,
    [idzaw]             INT             NULL,
    [data_pow]          DATETIME        NULL,
    [idroz_pow]         INT             NULL,
    [data_lik]          DATETIME        NULL,
    [idroz_lik]         INT             NULL,
    [idprz_lik]         INT             NULL,
    [idstet]            INT             NULL,
    [idstdoc]           INT             NULL,
    [idgr_zaw]          INT             NULL,
    [idwyk_og]          INT             NULL,
    [idwyk_res]         INT             NULL,
    [z_fin]             CHAR (10)       NULL,
    [id_uz]             INT             NULL,
    [d_zap]             DATETIME        NULL,
    [id_fun]            INT             NULL,
    [id_kat]            INT             NULL,
    [id_katD]           INT             NULL,
    [gr_zasz]           VARCHAR (20)    NULL,
    [idspfin]           INT             NULL,
    [lp]                INT             NULL,
    [wyn_wart]          INT             NULL,
    [kod_dook]          VARCHAR (9)     NULL,
    [idBeforeTransfer]  INT             NULL,
    [idWar]             INT             NULL,
    [idEtatKier]        INT             NULL,
    [polozenieEtatKier] VARCHAR (255)   NULL,
    [symbol]            VARCHAR (255)   NULL,
    CONSTRAINT [PK_ad_org_etat] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90) ON [FG_HER],
    CONSTRAINT [FK_ad_org_etat_idBeforeTransfer_ad_org_etat_id] FOREIGN KEY ([idBeforeTransfer]) REFERENCES [her].[ad_org_etat] ([id]),
    CONSTRAINT [FK_ad_org_etat_idEtatKier_ad_org_etat_id] FOREIGN KEY ([idEtatKier]) REFERENCES [her].[ad_org_etat] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ad_org_etat]
    ON [her].[ad_org_etat]([idwlas] ASC, [idstan] ASC) WITH (FILLFACTOR = 90)
    ON [FG_HER];

