CREATE TABLE [zef2DW].[HIPN_DokumentSkojarzony] (
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [DokumentZabezpieczony]     NVARCHAR (255)  NULL,
    [DataOperacji]              DATE            NULL,
    [NumerDokumentuPowiazanego] NVARCHAR (255)  NULL,
    [RodzajNaleznosci]          NVARCHAR (4000) NULL,
    [Kwota]                     DECIMAL (19, 2) NULL,
    [AktualneSaldo]             DECIMAL (19, 2) NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    [operacja]                  NVARCHAR (1)    NULL
);

