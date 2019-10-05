CREATE TABLE [zc].[PTW_DaneCelne] (
    [Id]                       NUMERIC (19)  NOT NULL,
    [MRN]                      VARCHAR (18)  NULL,
    [Kraj]                     CHAR (2)      NULL,
    [FlagaModyfikacji]         TINYINT       NULL,
    [FlagaIE303]               TINYINT       NULL,
    [FlagaOdrzucenie]          TINYINT       NULL,
    [FlagaOdrzuceniePrzyczyna] VARCHAR (4)   NULL,
    [ZnacznikWprowadzenia]     INT           NULL,
    [Szczegoly]                VARCHAR (MAX) NULL,
    [IdDokPTW]                 NUMERIC (19)  NULL,
    CONSTRAINT [PK_PTW_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PTW_DaneCelne_IdDokPTW_PTW_Dokument_Id] FOREIGN KEY ([IdDokPTW]) REFERENCES [zc].[PTW_Dokument] ([Id])
) TEXTIMAGE_ON [FG_ZC];

