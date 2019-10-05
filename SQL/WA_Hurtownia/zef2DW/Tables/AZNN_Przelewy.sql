CREATE TABLE [zef2DW].[AZNN_Przelewy] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [NazwaUrzeduSkarbowego]  NVARCHAR (255)  NULL,
    [KodKontrahenta]         NVARCHAR (4000) NULL,
    [RachunekBankowy]        NVARCHAR (4000) NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [AZNN_Przelewy_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

