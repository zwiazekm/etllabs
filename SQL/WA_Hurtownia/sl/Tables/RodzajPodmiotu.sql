CREATE TABLE [sl].[RodzajPodmiotu] (
    [Kod]   CHAR (1)     NOT NULL,
    [Nazwa] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Kod] ASC) ON [FG_SL]
);

