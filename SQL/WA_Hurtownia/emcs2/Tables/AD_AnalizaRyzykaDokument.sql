CREATE TABLE [emcs2].[AD_AnalizaRyzykaDokument] (
    [Id]                 NUMERIC (38)  NOT NULL,
    [PROCESS_COMM_ID]    NUMERIC (38)  NULL,
    [NrDokZISAR]         VARCHAR (100) NOT NULL,
    [NrDokSO]            VARCHAR (100) NOT NULL,
    [SystemOperacyjny]   VARCHAR (36)  NOT NULL,
    [RodzajDokumentu]    VARCHAR (36)  NOT NULL,
    [NrTypuKomunikatu]   VARCHAR (36)  NOT NULL,
    [WynikAnalizyRyzyka] VARCHAR (36)  NOT NULL,
    [UCZglaszajacyDoAAR] VARCHAR (20)  NOT NULL,
    [UCKontroliTowarow]  VARCHAR (20)  NULL,
    CONSTRAINT [AD_AnalizaRyzykaDokument$PK_AD_AnalizaRyzykaDokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2]
);

