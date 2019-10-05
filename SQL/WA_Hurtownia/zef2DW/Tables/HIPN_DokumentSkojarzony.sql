CREATE TABLE [zef2DW].[HIPN_DokumentSkojarzony] (
    [IdentyfikatorWpisu]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [DokumentZabezpieczony]     NVARCHAR (255)  NULL,
    [DataOperacji]              DATE            NULL,
    [NumerDokumentuPowiazanego] NVARCHAR (255)  NULL,
    [RodzajNaleznosci]          NVARCHAR (4000) NULL,
    [Kwota]                     DECIMAL (19, 2) NULL,
    [AktualneSaldo]             DECIMAL (19, 2) NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    CONSTRAINT [HIPN_DokumentSkojarzony_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

