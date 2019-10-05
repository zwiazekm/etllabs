CREATE TABLE [zc].[DWU_Towar] (
    [Id]                 DECIMAL (19)    NOT NULL,
    [NrPozycji]          INT             NULL,
    [CRN]                VARCHAR (70)    NULL,
    [TowNiebezp]         VARCHAR (4)     NULL,
    [OpisTowaru]         VARCHAR (280)   NULL,
    [KodTowarowy]        VARCHAR (8)     NULL,
    [MasaBrutto]         DECIMAL (18, 3) NULL,
    [OplatyTransportowe] CHAR (1)        NULL,
    [IdDokDWU]           DECIMAL (19)    NULL,
    CONSTRAINT [PK_DWU_Towar] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_Towar_IdDokDWU_DWU_Dokument_Id] FOREIGN KEY ([IdDokDWU]) REFERENCES [zc].[DWU_Dokument] ([Id])
);

