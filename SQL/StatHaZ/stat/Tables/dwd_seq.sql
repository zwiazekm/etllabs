CREATE TABLE [stat].[dwd_seq] (
    [nextval] INT         IDENTITY (1, 1) NOT NULL,
    [x]       VARCHAR (1) NULL
);


GO
CREATE STATISTICS [nextval]
    ON [stat].[dwd_seq]([nextval]);


GO
CREATE STATISTICS [x]
    ON [stat].[dwd_seq]([x]);

