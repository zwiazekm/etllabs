CREATE TABLE [zef2DW].[SADU_Uzupelniajacy] (
    [IdentyfikatorDokumentu]          BIGINT          NOT NULL,
    [IdentyfikatorWpsiuUzupelniajacy] DECIMAL (19, 2) NULL,
    [RodzajNaleznosciUzup]            NVARCHAR (8)    NULL,
    [KwotaNiekompletnyUzup]           DECIMAL (19, 2) NULL,
    [OdroczenieTerminuPlatnosci]      NVARCHAR (5)    NULL,
    [SaldoNaleznosci]                 DECIMAL (19, 2) NULL,
    [KwotaUzupelniajacaUzup]          DECIMAL (19, 2) NULL,
    [MetodaPlatnosciUzup2]            INT             NULL,
    [xmlUzupZ2]                       NVARCHAR (5)    NULL,
    [xmlUzupO2]                       NVARCHAR (5)    NULL,
    [DataArch]                        DATE            NULL,
    [ID_Pismo_xml]                    BIGINT          NULL,
    [operacja]                        NVARCHAR (1)    NULL,
    [MetodaPlatnosciUzup]             INT             NULL,
    [xmlUzupZ]                        NVARCHAR (5)    NULL,
    CONSTRAINT [SADU_Uzupelniajacy_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

