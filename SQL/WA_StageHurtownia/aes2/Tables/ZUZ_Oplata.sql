CREATE TABLE [aes2].[ZUZ_Oplata] (
    [Id]              NUMERIC (19)    NOT NULL,
    [Kwota]           NUMERIC (15, 2) NULL,
    [KwotaWUzupln]    NUMERIC (15, 2) NULL,
    [Podstawa]        NUMERIC (17, 2) NULL,
    [PodstawaWUzupln] NUMERIC (17, 2) NULL,
    [MP]              NVARCHAR (1)    NULL,
    [MPPid]           NVARCHAR (1)    NULL,
    [MPWUzupln]       NVARCHAR (1)    NULL,
    [MPWUzuplnPid]    NVARCHAR (1)    NULL,
    [Stawka]          NUMERIC (7, 2)  NULL,
    [StawkaWUzupln]   NUMERIC (7, 2)  NULL,
    [Typ]             NVARCHAR (3)    NULL,
    [TypPid]          NVARCHAR (3)    NULL,
    [TypWUzupln]      NVARCHAR (3)    NULL,
    [TypWUzuplnPid]   NVARCHAR (3)    NULL,
    [IdTowarZUZ]      NUMERIC (19)    NULL,
    CONSTRAINT [ZUZ_Oplata$PK_ZUZ_Oplata] PRIMARY KEY CLUSTERED ([Id] ASC)
);

