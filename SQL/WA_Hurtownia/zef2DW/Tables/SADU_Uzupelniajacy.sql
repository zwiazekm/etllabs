CREATE TABLE [zef2DW].[SADU_Uzupelniajacy] (
    [IdentyfikatorDokumentu]          BIGINT          NOT NULL,
    [IdentyfikatorWpsiuUzupelniajacy] INT             IDENTITY (1, 1) NOT NULL,
    [RodzajNaleznosciUzup]            NVARCHAR (8)    NULL,
    [KwotaNiekompletnyUzup]           DECIMAL (19, 2) NULL,
    [MetodaPlatnosciUzup]             INT             NULL,
    [xmlUzupZ]                        NVARCHAR (5)    NULL,
    [OdroczenieTerminuPlatnosci]      NVARCHAR (5)    NULL,
    [SaldoNaleznosci]                 DECIMAL (19, 2) NULL,
    [KwotaUzupelniajacaUzup]          DECIMAL (19, 2) NULL,
    [MetodaPlatnosciUzup2]            INT             NULL,
    [xmlUzupZ2]                       NVARCHAR (5)    NULL,
    [xmlUzupO2]                       NVARCHAR (5)    NULL,
    [DataArch]                        DATE            NULL,
    [ID_Pismo_xml]                    BIGINT          NULL,
    CONSTRAINT [PK_SADU_Uzupelniajacy] PRIMARY KEY CLUSTERED ([IdentyfikatorWpsiuUzupelniajacy] ASC) ON [FG_ZEF2DW]
);

