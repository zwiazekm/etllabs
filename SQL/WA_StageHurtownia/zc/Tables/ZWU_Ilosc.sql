CREATE TABLE [zc].[ZWU_Ilosc] (
    [Id]                DECIMAL (19)    NOT NULL,
    [Jm]                INT             NULL,
    [JmPid]             CHAR (3)        NULL,
    [KwalifikatorJm]    CHAR (1)        NULL,
    [KwalifikatorJmPid] INT             NULL,
    [Ilosc]             DECIMAL (18, 3) NULL,
    [IdTowarZwu]        DECIMAL (19)    NULL,
    CONSTRAINT [PK_ZWU_Ilosc] PRIMARY KEY CLUSTERED ([Id] ASC)
);

