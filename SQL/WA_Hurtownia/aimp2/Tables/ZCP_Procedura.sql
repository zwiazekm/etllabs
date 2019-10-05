CREATE TABLE [aimp2].[ZCP_Procedura] (
    [IdProcedury]     NUMERIC (19) NOT NULL,
    [IdTowarZCP]      NUMERIC (19) NULL,
    [Kod]             NVARCHAR (3) NOT NULL,
    [KodPid]          INT          NULL,
    [DanePokontrolne] NTEXT        NULL,
    CONSTRAINT [ZCP_Procedura_PK] PRIMARY KEY CLUSTERED ([IdProcedury] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Procedura$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

