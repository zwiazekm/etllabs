CREATE TABLE [tr].[TypyDeklaracji] (
    [Id]      VARCHAR (5)   NOT NULL,
    [NazwaPL] VARCHAR (140) NULL,
    [NazwaEN] VARCHAR (140) NULL,
    CONSTRAINT [PK_TypyDeklaracji] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

