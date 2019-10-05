CREATE TABLE [zc].[ZWU_Oplata] (
    [Id]         DECIMAL (19)    NOT NULL,
    [SumaOplat]  DECIMAL (17, 2) NULL,
    [Typ]        CHAR (3)        NULL,
    [TypPid]     INT             NULL,
    [Podstawa]   DECIMAL (17, 2) NULL,
    [Stawka]     DECIMAL (7, 2)  NULL,
    [Kwota]      DECIMAL (15, 2) NULL,
    [MP]         CHAR (1)        NULL,
    [MPPid]      INT             NULL,
    [IdTowarZWU] DECIMAL (19)    NULL,
    CONSTRAINT [PK_ZWU_Oplata] PRIMARY KEY CLUSTERED ([Id] ASC)
);

