CREATE TABLE [ncts2].[AnalizaRyzykaDokument] (
    [Id]                    BIGINT         NOT NULL,
    [NumerDokumentuZISAR]   NVARCHAR (100) NULL,
    [NumerDokumentuSO]      NVARCHAR (100) NULL,
    [SystemOperacyjny]      NVARCHAR (36)  NULL,
    [RodzajDokumentu]       NVARCHAR (36)  NULL,
    [NrTypuKomunikatu]      NVARCHAR (36)  NULL,
    [WynikAnalizyRyzyka]    NVARCHAR (36)  NULL,
    [UCZglaszajacyDoAAR]    NVARCHAR (20)  NULL,
    [UCKontroliTowarow]     NVARCHAR (20)  NULL,
    [MiejsceAnalizy]        NVARCHAR (1)   NULL,
    [CzasAnalizy]           NVARCHAR (20)  NULL,
    [Wersja]                NVARCHAR (20)  NULL,
    [RolaUrzedu]            NVARCHAR (20)  NULL,
    [IdKomunikatu]          BIGINT         NULL,
    [IdOperacjiTranzytowej] BIGINT         NULL,
    CONSTRAINT [AnalizaRyzykaDokument_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

