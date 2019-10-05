CREATE TABLE [emcs2].[AD_AnalizaRyzykaMetodyKontroli] (
    [Id]                       NUMERIC (38) NOT NULL,
    [IdObslugiWskazanKontroli] NUMERIC (38) NULL,
    [PoziomZdefiniowania]      VARCHAR (36) NOT NULL,
    [MetodaKontroli]           VARCHAR (36) NOT NULL,
    CONSTRAINT [AD_AnalizaRyzykaMetodyKontroli$PK_AD_AnalizaRyzykaMetodyKontroli] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2]
);

