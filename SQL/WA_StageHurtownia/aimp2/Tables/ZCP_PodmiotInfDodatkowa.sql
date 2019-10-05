﻿CREATE TABLE [aimp2].[ZCP_PodmiotInfDodatkowa] (
    [IdInformacji]            NUMERIC (19) NOT NULL,
    [IdPodmiotuGospodarczego] NUMERIC (19) NULL,
    [KodInfDodPodm]           NVARCHAR (5) NOT NULL,
    CONSTRAINT [ZCP_PodmiotInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

