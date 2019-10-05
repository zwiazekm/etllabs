CREATE TABLE [aes2].[ZWU_Korekta] (
    [Id]         NUMERIC (19)    NOT NULL,
    [IdTowarZWU] NUMERIC (19)    NULL,
    [KodKorekty] NVARCHAR (4)    NULL,
    [Wartosc]    NUMERIC (17, 2) NULL,
    CONSTRAINT [ZWU_Korekta$PK_ZWU_Korekta] PRIMARY KEY CLUSTERED ([Id] ASC)
);

