CREATE TABLE [aimp2].[PWD_PodmiotInfDodatkowa] (
    [IdInformacji]            NUMERIC (19) NOT NULL,
    [IdPodmiotuGospodarczego] NUMERIC (19) NULL,
    [KodInfDodPodm]           NVARCHAR (5) NOT NULL,
    CONSTRAINT [PWD_PodmiotInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_PodmiotInfDodatkowa$FK_PWD_Podmiot] FOREIGN KEY ([IdPodmiotuGospodarczego]) REFERENCES [aimp2].[PWD_Podmiot] ([IdKontrahenta])
);

