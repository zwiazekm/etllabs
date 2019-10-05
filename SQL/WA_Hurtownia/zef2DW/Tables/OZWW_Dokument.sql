CREATE TABLE [zef2DW].[OZWW_Dokument] (
    [IdentyfikatorDokumentu]            BIGINT          NOT NULL,
    [NieNaliczanieOdsetekDataDo]        DATE            NULL,
    [NieNaliczanieOdsetekDataOd]        DATE            NULL,
    [NieNaliczanieOdsetek]              NVARCHAR (5)    NULL,
    [DataWplywuOdwolania]               DATE            NULL,
    [OrganWydajacy]                     NVARCHAR (255)  NULL,
    [AdnotacjeIUwagi]                   NVARCHAR (512)  NULL,
    [MigracjaReczna]                    NVARCHAR (5)    NULL,
    [PozycjeRazemKwotaWstrzymana]       DECIMAL (19, 2) NULL,
    [Przyczyna]                         NVARCHAR (13)   NULL,
    [NumerDokumentu]                    NVARCHAR (255)  NULL,
    [DataWstrzymaniaWykonywaniaDecyzji] DATE            NULL,
    [ZazalenieDataWplywu]               DATE            NULL,
    [RaportWyslaniaSK]                  NVARCHAR (MAX)  NULL,
    [PierwotnyDataWydania]              DATE            NULL,
    [PierwotnyNumerDokumentu]           NVARCHAR (255)  NULL,
    [PierwotnyRodzajDokumentu]          NVARCHAR (255)  NULL,
    [DataArch]                          DATE            NULL,
    [ID_Pismo_xml]                      BIGINT          NULL,
    [IdentyfikatorPodatnika]            BIGINT          NOT NULL,
    CONSTRAINT [OZWW_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

