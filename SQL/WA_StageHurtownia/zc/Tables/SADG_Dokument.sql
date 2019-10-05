CREATE TABLE [zc].[SADG_Dokument] (
    [IdDok]               VARCHAR (30)  NOT NULL,
    [WersjaXML]           VARCHAR (7)   NULL,
    [DataWyeksportowania] DATETIME      NULL,
    [RodzajDok]           VARCHAR (5)   NULL,
    [JednWyjsciaId]       VARCHAR (6)   NULL,
    [JednWyjsciaIdPid]    INT           NULL,
    [JednWyjsciaPas]      CHAR (2)      NULL,
    [NrEwidencyjny]       VARCHAR (40)  NULL,
    [DataPrzyjecia]       DATETIME      NULL,
    [DataRejestracji]     DATETIME      NULL,
    [Status]              CHAR (1)      NULL,
    [NrEwidencjiWywoz]    VARCHAR (40)  NULL,
    [PotwierdzenieWywoz]  CHAR (1)      NULL,
    [EtapBilansowania]    CHAR (1)      NULL,
    [KodProcedury]        VARCHAR (6)   NULL,
    [Uwagi]               VARCHAR (255) NULL,
    CONSTRAINT [PK_SADG_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

