CREATE TABLE [tr].[RodzajeWynikowKontroli] (
    [Id]      CHAR (2)      NOT NULL,
    [NazwaPL] VARCHAR (140) NULL,
    [NazwaEN] VARCHAR (140) NULL,
    CONSTRAINT [PK_RodzajeWynikowKontroli] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

