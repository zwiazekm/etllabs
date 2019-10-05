CREATE TABLE [aimp2].[DSK_ZamkniecieCelneNumery] (
    [IdNumeru]               NUMERIC (19)  NOT NULL,
    [IdZamknieciaCelnego]    NUMERIC (19)  NOT NULL,
    [NumerZamknieciaCelnego] NVARCHAR (35) NULL,
    CONSTRAINT [DSK_ZamkniecieCelneNumery_PK] PRIMARY KEY CLUSTERED ([IdNumeru] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_ZamkniecieCelneNumery$FK_DSK_ZamkniecieCelne] FOREIGN KEY ([IdZamknieciaCelnego]) REFERENCES [aimp2].[DSK_ZamkniecieCelne] ([IdZamkniecia])
);

