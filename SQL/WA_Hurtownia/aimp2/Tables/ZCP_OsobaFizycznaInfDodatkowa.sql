CREATE TABLE [aimp2].[ZCP_OsobaFizycznaInfDodatkowa] (
    [IdInformacji]     NUMERIC (19) NOT NULL,
    [IdOsobyFizycznej] NUMERIC (19) NULL,
    [KodInfDodatk]     NVARCHAR (5) NULL,
    [KodInfDodatkPid]  INT          NULL,
    CONSTRAINT [ZCP_OsobaFizycznaInfDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_OsobaFizycznaInfDodatkowa$FK_ZCP_OsobaFizyczna] FOREIGN KEY ([IdOsobyFizycznej]) REFERENCES [aimp2].[ZCP_OsobaFizyczna] ([IdKontrahenta])
);

