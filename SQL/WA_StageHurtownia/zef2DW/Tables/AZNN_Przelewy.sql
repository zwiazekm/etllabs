CREATE TABLE [zef2DW].[AZNN_Przelewy] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [NazwaUrzeduSkarbowego]  NVARCHAR (255)  NULL,
    [KodKontrahenta]         NVARCHAR (4000) NULL,
    [RachunekBankowy]        NVARCHAR (4000) NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

