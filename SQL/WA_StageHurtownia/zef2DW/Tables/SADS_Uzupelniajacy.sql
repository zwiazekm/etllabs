CREATE TABLE [zef2DW].[SADS_Uzupelniajacy] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [RodzajNaleznosciUzup]       NVARCHAR (8)    NULL,
    [KwotaNiekompletnaUzup]      DECIMAL (19, 2) NULL,
    [OdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [SaldoNaleznosci]            DECIMAL (19, 2) NULL,
    [KwotaUzupelniajaca]         DECIMAL (19, 2) NULL,
    [MetodaPlatnosciUzup2]       INT             NULL,
    [xmlUzupZ2]                  NVARCHAR (5)    NULL,
    [xmlUzupO2]                  NVARCHAR (5)    NULL,
    [MetodaPlatnosciUzup]        INT             NULL,
    [xmlUzupZ]                   NVARCHAR (5)    NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [operacja]                   NVARCHAR (1)    NULL
);

