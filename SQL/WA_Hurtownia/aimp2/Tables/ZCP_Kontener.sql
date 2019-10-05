CREATE TABLE [aimp2].[ZCP_Kontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdDok]           NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NOT NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_Kontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Kontener$FK_ZCP_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[ZCP_Dokument] ([IdDok])
) TEXTIMAGE_ON [FG_AIMP2];

