CREATE TABLE [zc].[DWU_WynikAnalizyRyzyka] (
    [Id]                    DECIMAL (19)  NOT NULL,
    [NrPozycji]             INT           NULL,
    [KodAnalizyRyzyka]      VARCHAR (5)   NULL,
    [OpisKoduAnalizyRyzyka] VARCHAR (350) NULL,
    [IdDokDWU]              DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWU_WynikAnalizyRyzyka] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_WynikAnalizyRyzyka_IdDokDWU_DWU_Dokument_Id] FOREIGN KEY ([IdDokDWU]) REFERENCES [zc].[DWU_Dokument] ([Id])
);

