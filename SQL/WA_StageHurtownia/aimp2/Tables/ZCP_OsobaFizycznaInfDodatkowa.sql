﻿CREATE TABLE [aimp2].[ZCP_OsobaFizycznaInfDodatkowa] (
    [IdInformacji]     NUMERIC (19) NOT NULL,
    [IdOsobyFizycznej] NUMERIC (19) NULL,
    [KodInfDodatk]     NVARCHAR (5) NULL,
    [KodInfDodatkPid]  INT          NULL,
    CONSTRAINT [ZCP_OsobaFizycznaInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

