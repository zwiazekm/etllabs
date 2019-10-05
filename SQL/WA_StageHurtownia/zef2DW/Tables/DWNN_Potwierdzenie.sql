CREATE TABLE [zef2DW].[DWNN_Potwierdzenie] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWykonaniaPrzelewu]  DATE            NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

