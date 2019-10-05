CREATE TABLE [aimp2].[DPDZ_IloscTowaru] (
    [IdIlosci]                      NUMERIC (19)    NOT NULL,
    [IdTowarDPDZ]                   NUMERIC (19)    NULL,
    [IdPozycjiNaLiscieDokWym]       NUMERIC (5)     NULL,
    [KwalifikatorJednostkiMiary]    NVARCHAR (1)    NULL,
    [KwalifikatorJednostkiMiaryPid] INT             NULL,
    [IloscTowaruDoTARIC]            NUMERIC (16, 6) NULL,
    [JednostkaMiary]                NVARCHAR (3)    NULL,
    [JednostkaMiaryPid]             INT             NULL,
    CONSTRAINT [DPDZ_IloscTowaru_PK] PRIMARY KEY CLUSTERED ([IdIlosci] ASC)
);

