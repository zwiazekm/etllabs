CREATE TABLE [her].[ka_dp001] (
    [IdPrac]    INT      NOT NULL,
    [IdKodPlec] INT      NOT NULL,
    [DataUr]    DATETIME NOT NULL,
    CONSTRAINT [PK_ka_dp001_IdPrac] PRIMARY KEY CLUSTERED ([IdPrac] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp001_IdKodPlec_ka_dp25_id] FOREIGN KEY ([IdKodPlec]) REFERENCES [her].[ka_dp25] ([id])
);

