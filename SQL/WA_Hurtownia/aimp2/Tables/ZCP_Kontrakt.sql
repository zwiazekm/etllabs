CREATE TABLE [aimp2].[ZCP_Kontrakt] (
    [IdKontraktu]    NUMERIC (19)  NOT NULL,
    [IdDok]          NUMERIC (19)  NULL,
    [DataKontraktu]  DATETIME2 (3) NULL,
    [NumerKontraktu] NVARCHAR (35) NULL,
    CONSTRAINT [ZCP_Kontrakt_PK] PRIMARY KEY CLUSTERED ([IdKontraktu] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Kontrakt$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok])
);

