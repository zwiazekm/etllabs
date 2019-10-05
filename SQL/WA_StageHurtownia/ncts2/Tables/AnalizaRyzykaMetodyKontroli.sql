CREATE TABLE [ncts2].[AnalizaRyzykaMetodyKontroli] (
    [Id]                       BIGINT        NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT        NULL,
    [PoziomZdefiniowania]      NVARCHAR (36) NULL,
    [MetodaKontroli]           NVARCHAR (36) NULL,
    CONSTRAINT [AnalizaRyzykaMetodyKontroli_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

