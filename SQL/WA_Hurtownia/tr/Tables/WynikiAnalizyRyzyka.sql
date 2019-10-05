CREATE TABLE [tr].[WynikiAnalizyRyzyka] (
    [Id]      VARCHAR (1)   NOT NULL,
    [NazwaPL] VARCHAR (420) NULL,
    [NazwaEN] VARCHAR (420) NULL,
    CONSTRAINT [PK_WynikiAnalizyRyzyka] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

