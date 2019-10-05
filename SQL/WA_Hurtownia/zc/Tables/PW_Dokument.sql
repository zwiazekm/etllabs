CREATE TABLE [zc].[PW_Dokument] (
    [IdDok]               VARCHAR (30) NOT NULL,
    [WersjaXML]           VARCHAR (7)  NULL,
    [DataWyeksportowania] DATETIME     NULL,
    [RodzajDok]           VARCHAR (5)  NULL,
    [UrzadWyjsciaId]      VARCHAR (6)  NULL,
    [UrzadWyjsciaIdPid]   INT          NULL,
    [UrzadWyjsciaPas]     CHAR (2)     NULL,
    [DataRejestracji]     DATETIME     NULL,
    [DataPrzyjecia]       DATETIME     NULL,
    [NrEwidencyjny]       VARCHAR (40) NULL,
    [Status]              CHAR (1)     NULL,
    [Transport]           CHAR (2)     NULL,
    [TransportPid]        INT          NULL,
    CONSTRAINT [PK_PW_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PW_Dokument_TransportPid] FOREIGN KEY ([TransportPid]) REFERENCES [pdr].[s005] ([s005_id]),
    CONSTRAINT [FK_PW_Dokument_UrzadWyjsciaIdPid] FOREIGN KEY ([UrzadWyjsciaIdPid]) REFERENCES [pdr].[c001] ([c001_id])
);

