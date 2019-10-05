CREATE TABLE [ais2].[PTW_DaneCelne] (
    [Id]                       NUMERIC (19) NOT NULL,
    [Kraj]                     VARCHAR (2)  NULL,
    [KrajPid]                  INT          NULL,
    [MRN]                      VARCHAR (18) NULL,
    [IdTowarPTW]               NUMERIC (19) NULL,
    [Szczegoly]                TEXT         NULL,
    [FlagaModyfikacji]         VARCHAR (3)  NULL,
    [ENS_ID]                   NUMERIC (19) NULL,
    [FlagaIE303]               VARCHAR (3)  NULL,
    [FlagaOdrzucenieStatus]    VARCHAR (4)  NULL,
    [FlagaOdrzucenie]          VARCHAR (3)  NULL,
    [FlagaOdrzuceniePrzyczyna] VARCHAR (4)  NULL,
    [ZnacznikWprowadzenia]     INT          NULL,
    CONSTRAINT [PTW_DaneCelne$PK_PTW_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PTW_DaneCelne_IdTowarPTW__PTW_Towar_id] FOREIGN KEY ([IdTowarPTW]) REFERENCES [ais2].[PTW_Towar] ([Id])
) TEXTIMAGE_ON [FG_AIS2];

