CREATE TABLE [aimp2].[DSK_ZamkniecieCelneNumery] (
    [IdNumeru]               NUMERIC (19)  NOT NULL,
    [IdZamknieciaCelnego]    NUMERIC (19)  NOT NULL,
    [NumerZamknieciaCelnego] NVARCHAR (35) NULL,
    CONSTRAINT [DSK_ZamkniecieCelneNumery_PK] PRIMARY KEY CLUSTERED ([IdNumeru] ASC)
);

