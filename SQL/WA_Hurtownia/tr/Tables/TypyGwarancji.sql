CREATE TABLE [tr].[TypyGwarancji] (
    [Id]      CHAR (2)      NOT NULL,
    [NazwaPL] VARCHAR (420) NULL,
    [NazwaEN] VARCHAR (420) NULL,
    CONSTRAINT [PK_TypyGwarancji] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

