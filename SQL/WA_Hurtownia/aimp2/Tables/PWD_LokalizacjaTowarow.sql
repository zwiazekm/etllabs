CREATE TABLE [aimp2].[PWD_LokalizacjaTowarow] (
    [IdLokalizacji]              NUMERIC (19)  NOT NULL,
    [IdDok]                      NUMERIC (19)  NULL,
    [DodatkowyIdLokalizacji]     NVARCHAR (3)  NULL,
    [KodMiejscaLokalizacji]      NVARCHAR (35) NULL,
    [KrajLokalizacji]            NVARCHAR (2)  NULL,
    [KrajLokalizacjiPid]         INT           NULL,
    [OpisMiejscaLokalizacji]     NVARCHAR (70) NULL,
    [UrzadCelnyLokalizacji]      NVARCHAR (8)  NULL,
    [UrzadCelnyLokalizacjiPid]   INT           NULL,
    [KwalifikatorLokalizacji]    NVARCHAR (1)  NULL,
    [KwalifikatorLokalizacjiPid] INT           NULL,
    [TypLokalizacji]             NVARCHAR (1)  NULL,
    [TypLokalizacjiPid]          INT           NULL,
    [IdentyfikatorAdresu]        NUMERIC (19)  NULL,
    CONSTRAINT [PWD_LokalizacjaTowarow_PK] PRIMARY KEY CLUSTERED ([IdLokalizacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_LokalizacjaTowarow$FK_PWD_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[PWD_Dokument] ([IdDok])
);

