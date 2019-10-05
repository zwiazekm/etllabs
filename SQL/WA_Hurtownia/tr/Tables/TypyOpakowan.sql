CREATE TABLE [tr].[TypyOpakowan] (
    [Id]      CHAR (2)      NOT NULL,
    [NazwaPL] VARCHAR (420) NULL,
    [NazwaEN] VARCHAR (420) NULL,
    CONSTRAINT [PK_TypyOpakowan] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

