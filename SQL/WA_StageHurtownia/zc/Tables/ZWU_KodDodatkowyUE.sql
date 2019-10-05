CREATE TABLE [zc].[ZWU_KodDodatkowyUE] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodUE]      VARCHAR (4)  NULL,
    [KodUEPid]   INT          NULL,
    [IdTowarZWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_ZWU_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([Id] ASC)
);

