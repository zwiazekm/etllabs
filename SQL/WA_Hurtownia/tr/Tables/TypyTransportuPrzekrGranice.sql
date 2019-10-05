CREATE TABLE [tr].[TypyTransportuPrzekrGranice] (
    [Id]      VARCHAR (3)   NOT NULL,
    [NazwaPL] VARCHAR (105) NULL,
    [NazwaEN] VARCHAR (105) NULL,
    CONSTRAINT [PK_TypyTransportuPrzekrGranice] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

