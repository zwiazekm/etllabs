CREATE TABLE [aimp2].[DPDZ_PodmiotInfDodatkowa] (
    [IdInformacji]            NUMERIC (19) NOT NULL,
    [IdPodmiotuGospodarczego] NUMERIC (19) NULL,
    [KodInfDodPodm]           NVARCHAR (5) NOT NULL,
    CONSTRAINT [DPDZ_PodmiotInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

