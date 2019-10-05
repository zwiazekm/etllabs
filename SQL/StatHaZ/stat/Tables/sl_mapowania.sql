CREATE TABLE [stat].[sl_mapowania] (
    [rodzaj] VARCHAR (10) NOT NULL,
    [stary]  VARCHAR (10) NOT NULL,
    [nowy]   VARCHAR (10) NOT NULL,
    CONSTRAINT [PK_SL_MAPOWANIA] PRIMARY KEY CLUSTERED ([rodzaj] ASC, [stary] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [nowy]
    ON [stat].[sl_mapowania]([nowy]);


GO
CREATE STATISTICS [stary]
    ON [stat].[sl_mapowania]([stary]);

