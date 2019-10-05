CREATE TABLE [aes2].[ZUZ_Ilosc] (
    [Id]                       NUMERIC (19)    NOT NULL,
    [KwalifikatorJm]           NVARCHAR (1)    NULL,
    [KwalifikatorJmPid]        NVARCHAR (1)    NULL,
    [KwalifikatorJmWUzupln]    NVARCHAR (1)    NULL,
    [KwalifikatorJmWUzuplnPid] NVARCHAR (1)    NULL,
    [Ilosc]                    NUMERIC (18, 3) NULL,
    [IloscWUzupln]             NUMERIC (18, 3) NULL,
    [Jm]                       NVARCHAR (3)    NULL,
    [JmPid]                    NVARCHAR (3)    NULL,
    [JmWUzupln]                NVARCHAR (3)    NULL,
    [JmWUzuplnPid]             NVARCHAR (3)    NULL,
    [IdTowarZUZ]               NUMERIC (19)    NULL,
    CONSTRAINT [ZUZ_Ilosc$PK_ZUZ_Ilosc] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_Ilosc_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

