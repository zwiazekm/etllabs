CREATE TABLE [zef2DW].[DORA_Raty] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RatyNumerDokumentu]     NVARCHAR (255)  NULL,
    [RatyRodzajNaleznosci]   NVARCHAR (255)  NULL,
    [RatyNumer]              INT             NULL,
    [RatyTerminPlatnosci]    DATE            NULL,
    [RatyKwota]              DECIMAL (19, 2) NULL,
    [RatyOdsetki]            DECIMAL (19, 2) NULL,
    [OplataProlongacyjna]    DECIMAL (19, 2) NULL,
    [RatyA]                  NVARCHAR (5)    NULL,
    [DataAnulowaniaRaty]     DATE            NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [DORA_Raty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

