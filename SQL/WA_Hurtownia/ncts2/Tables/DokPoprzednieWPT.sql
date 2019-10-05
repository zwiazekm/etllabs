CREATE TABLE [ncts2].[DokPoprzednieWPT] (
    [IdTowaru]    BIGINT        NULL,
    [KodDokPoprz] NVARCHAR (6)  NULL,
    [NrDokPoprz]  NVARCHAR (35) NULL,
    [Uwagi]       NVARCHAR (26) NULL,
    [Id]          BIGINT        NOT NULL,
    [IdPozycji]   INT           NULL,
    CONSTRAINT [DokPoprzednieWPT_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [DokPoprzednieWPT_IdTowaru_Towary_fk] FOREIGN KEY ([IdTowaru]) REFERENCES [ncts2].[Towary] ([Id])
);

