CREATE TABLE [tr].[JednostkiMiary] (
    [Id]      VARCHAR (3)   NOT NULL,
    [NazwaPL] VARCHAR (140) NULL,
    [NazwaEN] VARCHAR (140) NULL,
    CONSTRAINT [PK_JednostkiMiary] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

