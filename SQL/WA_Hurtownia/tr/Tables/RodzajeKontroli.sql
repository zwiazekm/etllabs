CREATE TABLE [tr].[RodzajeKontroli] (
    [Id]      VARCHAR (1)   NOT NULL,
    [NazwaPL] VARCHAR (420) NULL,
    [NazwaEN] VARCHAR (420) NULL,
    CONSTRAINT [PK_RodzajeKontroli] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

