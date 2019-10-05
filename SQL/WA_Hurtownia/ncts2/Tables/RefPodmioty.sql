CREATE TABLE [ncts2].[RefPodmioty] (
    [Id]               BIGINT         NOT NULL,
    [IdSISC]           NVARCHAR (17)  NULL,
    [NumerEORI]        NVARCHAR (17)  NULL,
    [Imie]             NVARCHAR (60)  NULL,
    [Nazwisko]         NVARCHAR (90)  NULL,
    [NazwaPelna]       NVARCHAR (300) NULL,
    [NazwaSkrocona]    NVARCHAR (35)  NULL,
    [AdresUlica]       NVARCHAR (100) NULL,
    [AdresKodPocztowy] NVARCHAR (9)   NULL,
    [AdresMiejscowosc] NVARCHAR (52)  NULL,
    [AdresKodKraju]    NVARCHAR (2)   NULL,
    [AdresKodJezyka]   NVARCHAR (2)   NULL,
    [AdresTelefon]     NVARCHAR (35)  NULL,
    [AdresFax]         NVARCHAR (50)  NULL,
    [AdresEmail]       NVARCHAR (70)  NULL,
    [DataOd]           DATETIME       NULL,
    [DataDo]           DATETIME       NULL,
    CONSTRAINT [RefPodmioty_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

