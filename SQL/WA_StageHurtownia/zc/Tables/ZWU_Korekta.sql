CREATE TABLE [zc].[ZWU_Korekta] (
    [Id]         DECIMAL (19)    NOT NULL,
    [KodKorekty] VARCHAR (4)     NULL,
    [Wartosc]    DECIMAL (17, 2) NULL,
    [IdTowarZWU] DECIMAL (19)    NOT NULL,
    CONSTRAINT [PK_ZWU_Korekta] PRIMARY KEY CLUSTERED ([Id] ASC)
);

