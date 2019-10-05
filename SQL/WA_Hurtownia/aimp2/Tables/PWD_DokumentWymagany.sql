CREATE TABLE [aimp2].[PWD_DokumentWymagany] (
    [IdDokWym]              NUMERIC (19)    NOT NULL,
    [IdTowarPWD]            NUMERIC (19)    NULL,
    [AGRIMOpisNiezgodnosci] NVARCHAR (3072) NULL,
    [AGRIMWynik]            NVARCHAR (3)    NULL,
    [KodDokumentu]          NVARCHAR (4)    NULL,
    [KodDokumentuPid]       INT             NULL,
    [UwagiDoDokumentu]      NVARCHAR (35)   NULL,
    [NumerDokumentu]        NVARCHAR (35)   NULL,
    [DataWygasniecia]       DATETIME2 (3)   NULL,
    [NazwaInstytucji]       NVARCHAR (70)   NULL,
    [IloscTowaru]           NUMERIC (16, 6) NULL,
    [NumerPozycji]          NUMERIC (5)     NULL,
    [JednostkaMiary]        NVARCHAR (3)    NULL,
    [JednostkaMiaryPid]     INT             NULL,
    [DanePokontrolne]       NTEXT           NULL,
    CONSTRAINT [PWD_DokumentWymagany_PK] PRIMARY KEY CLUSTERED ([IdDokWym] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_DokumentWymagany$FK_PWD_Towar] FOREIGN KEY ([IdTowarPWD]) REFERENCES [aimp2].[PWD_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

