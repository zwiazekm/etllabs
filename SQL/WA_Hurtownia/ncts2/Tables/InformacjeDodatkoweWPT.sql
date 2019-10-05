CREATE TABLE [ncts2].[InformacjeDodatkoweWPT] (
    [IdTowaru]   BIGINT        NULL,
    [KodInfDod]  NVARCHAR (5)  NULL,
    [KrajWywozu] NVARCHAR (2)  NULL,
    [Tekst]      NVARCHAR (70) NULL,
    [Id]         BIGINT        NOT NULL,
    [WywozUE]    BIT           NULL,
    [IdPozycji]  INT           NULL,
    CONSTRAINT [InformacjeDodatkoweWPT_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [InformacjeDodatkoweWPT_IdTowaru_Towary_fk] FOREIGN KEY ([IdTowaru]) REFERENCES [ncts2].[Towary] ([Id])
);

