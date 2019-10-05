CREATE TABLE [zef2DW].[USAD_Potwierdzenie] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWykonaniaPrzelewu]  DATE            NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL,
    CONSTRAINT [USAD_Potwierdzenie_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

