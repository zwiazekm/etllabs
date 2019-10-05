CREATE TABLE [aimp2].[ZCP_LokalizacjaTowarow] (
    [IdLokalizacji]           NUMERIC (19)  NOT NULL,
    [IdDok]                   NUMERIC (19)  NULL,
    [DodatkowyIdLokalizacji]  NVARCHAR (3)  NULL,
    [KodMiejscaLokalizacji]   NVARCHAR (35) NULL,
    [KrajLokalizacji]         NVARCHAR (2)  NULL,
    [OpisMiejscaLokalizacji]  NVARCHAR (70) NULL,
    [UrzadCelnyLokalizacji]   NVARCHAR (8)  NULL,
    [KwalifikatorLokalizacji] NVARCHAR (1)  NULL,
    [TypLokalizacji]          NVARCHAR (1)  NULL,
    [IdentyfikatorAdresu]     NUMERIC (19)  NULL,
    CONSTRAINT [ZCP_LokalizacjaTowarow_PK] PRIMARY KEY CLUSTERED ([IdLokalizacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_LokalizacjaTowarow$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok]),
    CONSTRAINT [ZCP_LokalizacjaTowarow$FK_ZCP_PodmiotAdres] FOREIGN KEY ([IdentyfikatorAdresu]) REFERENCES [aimp2].[ZCP_PodmiotAdres] ([IdAdresu])
);

