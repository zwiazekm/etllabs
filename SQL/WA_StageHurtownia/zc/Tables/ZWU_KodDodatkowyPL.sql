CREATE TABLE [zc].[ZWU_KodDodatkowyPL] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodPL]      VARCHAR (4)  NULL,
    [KodPLPid]   INT          NULL,
    [IdTowarZWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_ZWU_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([Id] ASC)
);

