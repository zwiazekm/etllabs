CREATE TABLE [zef2DW].[OKAR_Wplaty] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [KwotaWplaty]            DECIMAL (19, 4) NULL,
    [NumerDokWplaty]         NVARCHAR (255)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [OKAR_Wplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

