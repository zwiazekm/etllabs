CREATE TABLE [zef2DW].[OKAR_Wplaty] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [KwotaWplaty]            DECIMAL (19, 4) NULL,
    [NumerDokWplaty]         NVARCHAR (255)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

