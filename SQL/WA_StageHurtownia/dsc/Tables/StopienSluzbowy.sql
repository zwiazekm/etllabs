CREATE TABLE [dsc].[StopienSluzbowy] (
    [IDStopienSluzbowy]    INT NOT NULL,
    [IDKodStopienSluzbowy] INT NULL,
    [IDPracownik]          INT NOT NULL,
    CONSTRAINT [PK_StopienSluzbowy] PRIMARY KEY CLUSTERED ([IDStopienSluzbowy] ASC)
);

