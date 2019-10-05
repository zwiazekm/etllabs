CREATE TABLE [aimp2].[ZCP_PodmiotInfDodatkowa] (
    [IdInformacji]            NUMERIC (19) NOT NULL,
    [IdPodmiotuGospodarczego] NUMERIC (19) NULL,
    [KodInfDodPodm]           NVARCHAR (5) NOT NULL,
    CONSTRAINT [ZCP_PodmiotInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_PodmiotInfDodatkowa$FK_ZCP_Podmiot] FOREIGN KEY ([IdPodmiotuGospodarczego]) REFERENCES [aimp2].[ZCP_Podmiot] ([IdKontrahenta])
);

