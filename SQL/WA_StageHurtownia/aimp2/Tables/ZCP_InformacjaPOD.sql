CREATE TABLE [aimp2].[ZCP_InformacjaPOD] (
    [IdInformacji]                  NUMERIC (19)  NOT NULL,
    [IdDok]                         NUMERIC (19)  NOT NULL,
    [DataStworzenia]                DATETIME2 (3) NOT NULL,
    [DataPoznaniaDluguPrzezPodmiot] DATETIME2 (3) NULL,
    [IdKomunikatuZC291]             NUMERIC (19)  NULL,
    [StatusPOD]                     NVARCHAR (40) NOT NULL,
    [IdDecyzjiAdministracyjnej]     NUMERIC (19)  NULL,
    CONSTRAINT [ZCP_InformacjaPOD_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

