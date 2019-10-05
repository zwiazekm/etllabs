CREATE TABLE [dsc].[StopienSluzbowy] (
    [IDStopienSluzbowy]    INT NOT NULL,
    [IDKodStopienSluzbowy] INT NULL,
    [IDPracownik]          INT NOT NULL,
    CONSTRAINT [PK_StopienSluzbowy] PRIMARY KEY CLUSTERED ([IDStopienSluzbowy] ASC) ON [FG_DSC],
    CONSTRAINT [FK_StopienSluzbowy_IDKodStopienSluzbowy_Slownik_ID] FOREIGN KEY ([IDKodStopienSluzbowy]) REFERENCES [dsc].[Slownik] ([ID]),
    CONSTRAINT [FK_StopienSluzbowy_IDPracownik_Pracownik_IDPracownik] FOREIGN KEY ([IDPracownik]) REFERENCES [dsc].[Pracownik] ([IDPracownik])
);

