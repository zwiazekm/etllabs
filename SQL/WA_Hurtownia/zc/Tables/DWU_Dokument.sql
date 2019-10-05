CREATE TABLE [zc].[DWU_Dokument] (
    [Id]                      DECIMAL (19)    NOT NULL,
    [Status]                  CHAR (1)        NULL,
    [NrWlasny]                VARCHAR (22)    NULL,
    [MRN]                     VARCHAR (35)    NULL,
    [CRN]                     VARCHAR (70)    NULL,
    [UCZlozenia]              VARCHAR (8)     NULL,
    [UCWyprowadzenia]         VARCHAR (8)     NULL,
    [SpecyficzneOkolicznosci] CHAR (1)        NULL,
    [LiczbaPozycji]           INT             NULL,
    [LiczbaOpakowan]          INT             NULL,
    [MasaBrutto]              DECIMAL (18, 3) NULL,
    [KodTypOplatTransp]       CHAR (1)        NULL,
    [PodpisElektroniczny]     TINYINT         NULL,
    [DataPrzyjecia]           DATETIME        NULL,
    [DataZgody]               DATETIME        NULL,
    [Data]                    DATETIME        NULL,
    [Miejsce]                 VARCHAR (35)    NULL,
    CONSTRAINT [PK_DWU_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC]
);

