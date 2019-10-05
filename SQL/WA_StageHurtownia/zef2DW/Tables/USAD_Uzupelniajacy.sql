CREATE TABLE [zef2DW].[USAD_Uzupelniajacy] (
    [IdentyfikatorDokumentu]                              BIGINT          NOT NULL,
    [KwotaNaleznosciZgloszeniaUzupelniajacego]            DECIMAL (19, 2) NULL,
    [SaldoNaleznosci]                                     DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]                                     INT             NULL,
    [CzyOdroczenieTerminuPlatnosci]                       NVARCHAR (5)    NULL,
    [CzyZwolnienieZZaplaty]                               NVARCHAR (5)    NULL,
    [RodzajNaleznosciUzup]                                NVARCHAR (255)  NULL,
    [KwotaNaleznosciZgloszenieNiekompletne]               DECIMAL (19, 2) NULL,
    [MetodaPlatnosciZgloszenieNiekompletne]               INT             NULL,
    [CzyZwolnienieZZaplatyZgloszenieNiekompletne]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosciZgloszenieNiekompletne] NVARCHAR (5)    NULL,
    [ID_Pismo_xml]                                        BIGINT          NULL,
    [DataArch]                                            DATE            NULL,
    [operacja]                                            NVARCHAR (1)    NULL,
    CONSTRAINT [USAD_Uzupelniajacy_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

