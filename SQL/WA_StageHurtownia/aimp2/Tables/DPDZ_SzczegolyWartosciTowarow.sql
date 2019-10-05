﻿CREATE TABLE [aimp2].[DPDZ_SzczegolyWartosciTowarow] (
    [idWpisu]             NUMERIC (19) NOT NULL,
    [IdWartosciTowarDPDZ] NUMERIC (19) NULL,
    [KodSzczegolyWart]    NVARCHAR (5) NOT NULL,
    [NumerPozycji]        NUMERIC (1)  NOT NULL,
    [DanePokontrolne]     NTEXT        NULL,
    CONSTRAINT [DPDZ_SzczegolyWartosciTowarow_PK] PRIMARY KEY CLUSTERED ([idWpisu] ASC)
);

