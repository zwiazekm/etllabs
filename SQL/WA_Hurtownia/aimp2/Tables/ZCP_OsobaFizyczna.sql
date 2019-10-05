CREATE TABLE [aimp2].[ZCP_OsobaFizyczna] (
    [IdKontrahenta]          NUMERIC (19)  NOT NULL,
    [IdDok]                  NUMERIC (19)  NULL,
    [PlacowkaPodmiotu]       NCHAR (2)     NULL,
    [RodzajOsoby]            NVARCHAR (20) NOT NULL,
    [NumerIdentyfikacyjny]   NVARCHAR (30) NULL,
    [IdentyfikatorOsoby]     NVARCHAR (18) NULL,
    [Imie]                   NVARCHAR (30) NULL,
    [Nazwisko]               NVARCHAR (40) NULL,
    [PESEL]                  NVARCHAR (11) NULL,
    [RodzajReprezentanta]    NCHAR (3)     NULL,
    [DanePokontrolne]        NTEXT         NULL,
    [IdAdresu]               NUMERIC (19)  NULL,
    [IdOsobyPodpisujacejDok] NUMERIC (19)  NULL,
    CONSTRAINT [ZCP_OsobaFizyczna_PK] PRIMARY KEY CLUSTERED ([IdKontrahenta] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_OsobaFizyczna$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok]),
    CONSTRAINT [ZCP_OsobaFizyczna$FK_ZCP_PodmiotAdres] FOREIGN KEY ([IdAdresu]) REFERENCES [aimp2].[ZCP_PodmiotAdres] ([IdAdresu])
) TEXTIMAGE_ON [FG_AIMP2];

