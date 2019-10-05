CREATE TABLE [tr].[TypyDeklaracji] (
    [Id]      VARCHAR (5)   NOT NULL,
    [NazwaPL] VARCHAR (105) NULL,
    [NazwaEN] VARCHAR (105) NULL,
    CONSTRAINT [PK_TypyDeklaracji] PRIMARY KEY CLUSTERED ([Id] ASC)
);

