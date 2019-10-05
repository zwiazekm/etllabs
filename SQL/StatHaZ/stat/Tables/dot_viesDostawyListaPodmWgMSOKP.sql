CREATE TABLE [stat].[dot_viesDostawyListaPodmWgMSOKP] (
    [RokMc]            INT          NOT NULL,
    [kodKraju]         VARCHAR (2)  NOT NULL,
    [idPod]            VARCHAR (35) NOT NULL,
    [kodTowarowy]      VARCHAR (8)  NULL,
    [krajPochodzenia]  VARCHAR (2)  NULL,
    [rodzajTransakcji] VARCHAR (2)  NULL,
    [dostawyBezposr]   DECIMAL (15) NOT NULL,
    [sumaDlaPodmiotow] DECIMAL (15) NOT NULL,
    [msokp]            FLOAT (53)   NOT NULL
);

