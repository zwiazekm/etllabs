CREATE TABLE [zc].[PTW_DaneCelne] (
    [Id]                       NUMERIC (19)  NOT NULL,
    [MRN]                      VARCHAR (18)  NULL,
    [Kraj]                     CHAR (2)      NULL,
    [KrajPid]                  INT           NULL,
    [FlagaModyfikacji]         TINYINT       NULL,
    [FlagaIE303]               TINYINT       NULL,
    [FlagaOdrzucenie]          TINYINT       NULL,
    [FlagaOdrzuceniePrzyczyna] VARCHAR (4)   NULL,
    [ZnacznikWprowadzenia]     INT           NULL,
    [Szczegoly]                VARCHAR (MAX) NULL,
    [IdDokPTW]                 NUMERIC (19)  NULL,
    CONSTRAINT [PK_PTW_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

