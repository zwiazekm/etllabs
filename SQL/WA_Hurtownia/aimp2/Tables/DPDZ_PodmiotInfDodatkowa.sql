CREATE TABLE [aimp2].[DPDZ_PodmiotInfDodatkowa] (
    [IdInformacji]            NUMERIC (19) NOT NULL,
    [IdPodmiotuGospodarczego] NUMERIC (19) NULL,
    [KodInfDodPodm]           NVARCHAR (5) NOT NULL,
    CONSTRAINT [DPDZ_PodmiotInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [DPDZ_PodmiotInfDodatkowa$FK_DPDZ_Podmiot] FOREIGN KEY ([IdPodmiotuGospodarczego]) REFERENCES [aimp2].[DPDZ_Podmiot] ([IdKontrahenta])
);

