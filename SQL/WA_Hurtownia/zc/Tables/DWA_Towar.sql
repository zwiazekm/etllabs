CREATE TABLE [zc].[DWA_Towar] (
    [Id]                   DECIMAL (19)    NOT NULL,
    [NrPozycji]            INT             NULL,
    [CRN]                  VARCHAR (70)    NULL,
    [CRNNaGranicy]         VARCHAR (70)    NULL,
    [TowNiebezp]           VARCHAR (4)     NULL,
    [TowNiebezpNaGranicy]  VARCHAR (4)     NULL,
    [OpisTowaru]           VARCHAR (280)   NULL,
    [OpisTowaruNaGranicy]  VARCHAR (280)   NULL,
    [KodTowarowy]          VARCHAR (8)     NULL,
    [KodTowarowyNaGranicy] VARCHAR (8)     NULL,
    [MasaBrutto]           DECIMAL (18, 3) NULL,
    [MasaBruttoNaGranicy]  DECIMAL (18, 3) NULL,
    [OplTransp]            CHAR (1)        NULL,
    [OplTranspNaGranicy]   CHAR (1)        NULL,
    [IdDokDWA]             DECIMAL (19)    NULL,
    CONSTRAINT [PK_DWA_Towar] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_Towar_IdDokDWA_DWA_Dokument_Id] FOREIGN KEY ([IdDokDWA]) REFERENCES [zc].[DWA_Dokument] ([Id])
);

