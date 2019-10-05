﻿CREATE TABLE [aimp2].[DPDZ_InformacjaDodatkowa] (
    [IdInfDodatk]     NUMERIC (19)   NOT NULL,
    [IdTowarDPDZ]     NUMERIC (19)   NULL,
    [KodInfDodatk]    NVARCHAR (5)   NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    [DanePokontrolne] NTEXT          NULL,
    CONSTRAINT [DPDZ_InformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInfDodatk] ASC)
);

