CREATE TABLE [zc].[PSP_Dokument] (
    [IdDok]               VARCHAR (30)  NOT NULL,
    [WersjaXML]           VARCHAR (7)   NULL,
    [DataWyeksportowania] DATETIME      NULL,
    [RodzajDok]           VARCHAR (5)   NULL,
    [PlacowkaId]          VARCHAR (6)   NULL,
    [PlacowkaIdPid]       INT           NULL,
    [PlacowkaPas]         CHAR (2)      NULL,
    [DataRejestracji]     DATETIME      NULL,
    [NrEwidencyjny]       VARCHAR (40)  NULL,
    [DataPrzyjecia]       DATETIME      NULL,
    [StatusDok]           CHAR (1)      NULL,
    [IdPrzewoznik]        VARCHAR (30)  NULL,
    [Kierunek]            VARCHAR (6)   NULL,
    [Transport]           CHAR (2)      NULL,
    [TransportPid]        INT           NULL,
    [Uwagi]               VARCHAR (255) NULL,
    CONSTRAINT [PK_PSP_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

