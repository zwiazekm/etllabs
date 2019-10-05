CREATE TABLE [emcs2].[AD_AnalizaRyzykaZespolKontroli] (
    [Id]                       NUMERIC (38)  NOT NULL,
    [IdObslugiWskazanKontroli] NUMERIC (38)  NULL,
    [Login]                    VARCHAR (200) NOT NULL,
    [RejestratorWynikowZISAR]  CHAR (1)      NOT NULL,
    CONSTRAINT [AD_AnalizaRyzykaZespolKontroli$PK_AD_AnalizaRyzykaZespolKontroli] PRIMARY KEY CLUSTERED ([Id] ASC)
);

