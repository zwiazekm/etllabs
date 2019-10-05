CREATE TABLE [aimp2].[ZCP_WarunkiDostawy] (
    [IdWpisu]                       NUMERIC (19)   NOT NULL,
    [IdDok]                         NUMERIC (19)   NULL,
    [Kod]                           NVARCHAR (3)   NULL,
    [KodPid]                        INT            NULL,
    [Kraj]                          NVARCHAR (2)   NULL,
    [KrajPid]                       INT            NULL,
    [Miejsce]                       NVARCHAR (255) NULL,
    [KodPolozeniaMiejscaDostawy]    NVARCHAR (255) NULL,
    [KodPolozeniaMiejscaDostawyPid] INT            NULL,
    [KodBlokady]                    NVARCHAR (17)  NULL,
    CONSTRAINT [ZCP_WarunkiDostawy_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_WarunkiDostawy$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok])
);

