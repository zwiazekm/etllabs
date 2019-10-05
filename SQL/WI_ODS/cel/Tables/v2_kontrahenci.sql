CREATE TABLE [cel].[v2_kontrahenci] (
    [idKntr]      INT          NOT NULL,
    [Nazwa]       VARCHAR (35) NULL,
    [UlicaNumer]  VARCHAR (35) NULL,
    [KodPocztowy] VARCHAR (9)  NULL,
    [Miejscowosc] VARCHAR (35) NULL,
    [Kraj]        VARCHAR (2)  NULL,
    [TIN]         VARCHAR (12) NULL,
    [Regon]       VARCHAR (14) NULL,
    [Pesel]       VARCHAR (11) NULL,
    [CRP]         VARCHAR (19) NULL,
    [QuasiId]     INT          NULL,
    CONSTRAINT [PK_V2_KONTRAHENCI] PRIMARY KEY CLUSTERED ([idKntr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);


GO
CREATE NONCLUSTERED INDEX [IX_v2_kontrahenci]
    ON [cel].[v2_kontrahenci]([QuasiId] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [ix_v2_kontrahenci_tin]
    ON [cel].[v2_kontrahenci]([TIN] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [k_kntr_nazwa]
    ON [cel].[v2_kontrahenci]([Nazwa] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [k_kntr_regon]
    ON [cel].[v2_kontrahenci]([Regon] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

