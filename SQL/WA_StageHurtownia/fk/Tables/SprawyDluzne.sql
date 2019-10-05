CREATE TABLE [fk].[SprawyDluzne] (
    [IdDokumentuSprawy]         VARCHAR (30) NOT NULL,
    [IdKomorki]                 VARCHAR (20) NULL,
    [IdPodmiotu]                INT          NULL,
    [IdJednostki]               CHAR (6)     NULL,
    [IdJednostkiPid]            INT          NULL,
    [IdRodzajuDokumentu]        CHAR (4)     NULL,
    [SymbolDokumentu]           VARCHAR (30) NULL,
    [DataWystawieniaDokumentu]  DATETIME     NULL,
    [DataPowstaniaZadluzenia]   DATETIME     NULL,
    [DataSplaceniaZadluzenia]   DATETIME     NULL,
    [StatusSprawy]              CHAR (1)     NULL,
    [DataSkierowaniaDoDluznika] DATETIME     NULL,
    [PrzyczynyZadluzenia]       VARCHAR (6)  NULL,
    CONSTRAINT [PK_SprawyDluzne] PRIMARY KEY CLUSTERED ([IdDokumentuSprawy] ASC)
);

