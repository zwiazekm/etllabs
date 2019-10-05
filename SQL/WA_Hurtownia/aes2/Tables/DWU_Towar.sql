CREATE TABLE [aes2].[DWU_Towar] (
    [Id]                    NUMERIC (19)    NOT NULL,
    [KodTowarowy]           NVARCHAR (8)    NULL,
    [KodTowarowyPid]        INT             NULL,
    [CRN]                   NVARCHAR (70)   NULL,
    [OpisTowaru]            NVARCHAR (280)  NULL,
    [MasaBrutto]            NUMERIC (18, 3) NULL,
    [NrPozycji]             INT             NULL,
    [OplatyTransportowe]    NVARCHAR (1)    NULL,
    [OplatyTransportowePid] INT             NULL,
    [TowNiebezp]            NVARCHAR (4)    NULL,
    [TowNiebezpPid]         INT             NULL,
    [IdDokDWU]              NUMERIC (19)    NULL,
    CONSTRAINT [DWU_Towar$PK_DWU_Towar] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_Towar_IdDokDWU__DWU_Dokument_id] FOREIGN KEY ([IdDokDWU]) REFERENCES [aes2].[DWU_Dokument] ([Id])
);

