CREATE TABLE [her].[ka_dp004] (
    [IdDp004]          INT NOT NULL,
    [IdPrac]           INT NOT NULL,
    [IdKodPoziomWyksz] INT NULL,
    CONSTRAINT [PK_ka_dp004_IdDp004] PRIMARY KEY CLUSTERED ([IdDp004] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp004_IdKodPoziomWyksz_ka_dp25_id] FOREIGN KEY ([IdKodPoziomWyksz]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp004_IdPrac_ka_dp001_IdPrac] FOREIGN KEY ([IdPrac]) REFERENCES [her].[ka_dp001] ([IdPrac])
);


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp004_IdPrac]
    ON [her].[ka_dp004]([IdPrac] ASC)
    ON [FG_HER];

