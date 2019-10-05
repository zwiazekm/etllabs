CREATE TABLE [cel].[kontrahenci] (
    [id_kntr]     VARCHAR (30)  NOT NULL,
    [rodz_kntr]   VARCHAR (2)   NULL,
    [nazwa]       VARCHAR (255) NULL,
    [kraj]        VARCHAR (40)  NULL,
    [kod]         VARCHAR (10)  NULL,
    [miejscowosc] VARCHAR (60)  NULL,
    [adres]       VARCHAR (80)  NULL,
    [nip]         VARCHAR (20)  NULL,
    [regon]       VARCHAR (20)  NULL,
    [pesel]       VARCHAR (20)  NULL,
    [nrdowos]     VARCHAR (30)  NULL,
    [BNazwa]      VARCHAR (80)  NULL,
    [BKonto]      VARCHAR (60)  NULL,
    [IdKntr]      INT           NOT NULL,
    [QuasiId]     INT           NULL,
    CONSTRAINT [PK_KONTRAHENCI] PRIMARY KEY CLUSTERED ([id_kntr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);


GO
CREATE NONCLUSTERED INDEX [k_kntr_nazwa]
    ON [cel].[kontrahenci]([nazwa] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [k_kntr_pesel]
    ON [cel].[kontrahenci]([pesel] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [k_kntr_regon]
    ON [cel].[kontrahenci]([regon] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [kntr_quasiid]
    ON [cel].[kontrahenci]([QuasiId] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

