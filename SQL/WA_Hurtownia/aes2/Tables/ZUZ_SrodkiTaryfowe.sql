CREATE TABLE [aes2].[ZUZ_SrodkiTaryfowe] (
    [Id]                           NUMERIC (19) NOT NULL,
    [KodObszaruSrodka]             NVARCHAR (4) NULL,
    [KodObszaruSrodkaWUzupln]      NVARCHAR (4) NULL,
    [NumerPorzadkowySrodka]        NVARCHAR (6) NULL,
    [NumerPorzadkowySrodkaWUzupln] NVARCHAR (6) NULL,
    [SeriaSrodkaTaryfowego]        NVARCHAR (2) NULL,
    [SeriaSrodkaTaryfowegoWUzupln] NVARCHAR (1) NULL,
    [KodUzupJM]                    NVARCHAR (3) NULL,
    [KwalifikatorUzupJM]           NVARCHAR (1) NULL,
    [KwalifikatorUzupJMWUzupln]    NVARCHAR (1) NULL,
    [KodUzupJMWUzupln]             NVARCHAR (3) NULL,
    [IdSrodkaTaryfowego]           NUMERIC (19) NULL,
    [IdSrodkaTaryfowegoWUzupln]    NUMERIC (19) NULL,
    [TypSrodka]                    NVARCHAR (6) NULL,
    [TypSrodkaWUzupln]             NVARCHAR (3) NULL,
    [IdTowarZUZ]                   NUMERIC (19) NULL,
    CONSTRAINT [ZUZ_SrodkiTaryfowe$PK_ZUZ_SrodkiTaryfowe] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_SrodkiTaryfowe_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

