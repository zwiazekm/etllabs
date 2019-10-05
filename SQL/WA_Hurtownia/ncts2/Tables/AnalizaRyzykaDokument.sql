CREATE TABLE [ncts2].[AnalizaRyzykaDokument] (
    [Id]                    BIGINT         NOT NULL,
    [NumerDokumentuZISAR]   NVARCHAR (100) NOT NULL,
    [NumerDokumentuSO]      NVARCHAR (100) NOT NULL,
    [SystemOperacyjny]      NVARCHAR (36)  NOT NULL,
    [RodzajDokumentu]       NVARCHAR (36)  NOT NULL,
    [NrTypuKomunikatu]      NVARCHAR (36)  NOT NULL,
    [WynikAnalizyRyzyka]    NVARCHAR (36)  NOT NULL,
    [UCZglaszajacyDoAAR]    NVARCHAR (20)  NOT NULL,
    [UCKontroliTowarow]     NVARCHAR (20)  NULL,
    [MiejsceAnalizy]        NVARCHAR (1)   NOT NULL,
    [CzasAnalizy]           NVARCHAR (20)  NOT NULL,
    [Wersja]                NVARCHAR (20)  NOT NULL,
    [RolaUrzedu]            NVARCHAR (20)  NOT NULL,
    [IdKomunikatu]          BIGINT         NULL,
    [IdOperacjiTranzytowej] BIGINT         NOT NULL,
    CONSTRAINT [AnalizaRyzykaDokument_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

