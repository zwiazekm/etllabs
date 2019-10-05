CREATE TABLE [aimp2].[ariadna_dokument] (
    [id]                    NUMERIC (19)   NOT NULL,
    [numer_dokumentu_ZISAR] NVARCHAR (300) NULL,
    [numer_dokumentu_SO]    NVARCHAR (300) NULL,
    [system_operacyjny]     NVARCHAR (108) NULL,
    [rodzaj_dokumentu]      NVARCHAR (108) NULL,
    [nr_typu_komunikatu]    NVARCHAR (108) NULL,
    [wynik_analizy_ryzyka]  NVARCHAR (108) NULL,
    [uc_zglaszajacy_do_AAR] NVARCHAR (60)  NULL,
    [uc_kontroli_towarow]   NVARCHAR (60)  NULL,
    CONSTRAINT [ariadna_dokument_PK] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIMP2]
);

