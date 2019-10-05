CREATE TABLE [tr].[NazwyKodowInterwencjiCelnej] (
    [Id]      VARCHAR (4)   NOT NULL,
    [NazwaPL] VARCHAR (420) NULL,
    [NazwaEN] VARCHAR (420) NULL,
    CONSTRAINT [PK_NazwyKodowInterwencjiCelnej] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_TR]
);

