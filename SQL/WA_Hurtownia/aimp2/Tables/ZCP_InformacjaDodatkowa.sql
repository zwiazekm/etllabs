CREATE TABLE [aimp2].[ZCP_InformacjaDodatkowa] (
    [IdInformacji]    NUMERIC (19)   NOT NULL,
    [IdDok]           NUMERIC (19)   NULL,
    [KodInfDodatk]    NVARCHAR (5)   NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    CONSTRAINT [ZCP_InformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_InformacjaDodatkowa$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok])
);

