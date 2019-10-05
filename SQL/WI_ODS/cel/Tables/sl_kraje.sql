CREATE TABLE [cel].[sl_kraje] (
    [kod]       VARCHAR (3)  NOT NULL,
    [nazwa]     VARCHAR (50) NULL,
    [kontynent] VARCHAR (20) NULL,
    CONSTRAINT [PK_sl_kraje] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

