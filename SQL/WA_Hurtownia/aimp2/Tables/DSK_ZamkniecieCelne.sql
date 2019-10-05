CREATE TABLE [aimp2].[DSK_ZamkniecieCelne] (
    [IdZamkniecia]             NUMERIC (19)  NOT NULL,
    [IdDok]                    NUMERIC (19)  NULL,
    [IloscZamkniecCelnych]     NUMERIC (4)   NULL,
    [RodzajZamkniecCelnych]    NVARCHAR (35) NULL,
    [RodzajZamkniecCelnychPid] INT           NULL,
    CONSTRAINT [DSK_ZamkniecieCelne_PK] PRIMARY KEY CLUSTERED ([IdZamkniecia] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_ZamkniecieCelne$FK_DSK_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[DSK_Dokument] ([IdDok])
);

