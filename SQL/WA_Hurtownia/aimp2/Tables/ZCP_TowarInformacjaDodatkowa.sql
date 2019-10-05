CREATE TABLE [aimp2].[ZCP_TowarInformacjaDodatkowa] (
    [IdInfDod]        NUMERIC (19)   NOT NULL,
    [IdTowarZCP]      NUMERIC (19)   NULL,
    [KodInfDodatk]    NVARCHAR (5)   NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    [DanePokontrolne] NTEXT          NULL,
    CONSTRAINT [ZCP_TowarInformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInfDod] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_TowarInformacjaDodatkowa$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

