﻿CREATE TABLE [zef2DW].[USAD_Potwierdzenie] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWykonaniaPrzelewu]  DATE            NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [USAD_Potwierdzenie_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

