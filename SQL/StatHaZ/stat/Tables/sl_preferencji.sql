CREATE TABLE [stat].[sl_preferencji] (
    [kod] VARCHAR (3) NULL
);


GO
CREATE STATISTICS [kod]
    ON [stat].[sl_preferencji]([kod]);

