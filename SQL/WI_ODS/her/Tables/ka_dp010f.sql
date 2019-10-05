CREATE TABLE [her].[ka_dp010f] (
    [RV]             BINARY (8)  NULL,
    [DataZap]        DATETIME    NULL,
    [IdUzZap]        INT         NULL,
    [IdDp010f]       INT         NOT NULL,
    [IdPrac]         INT         NOT NULL,
    [DataOd]         DATETIME    NULL,
    [KodKorpus]      VARCHAR (9) NULL,
    [IdKodKorpus]    INT         NULL,
    [KodStopien]     VARCHAR (9) NULL,
    [IdKodStopien]   INT         NOT NULL,
    [KodTrybMian]    VARCHAR (9) NULL,
    [IdKodTrybMian]  INT         NULL,
    [DataNastMian]   DATETIME    NULL,
    [DataNastMianDo] DATETIME    NULL,
    [Wyroznienie]    BIT         NULL,
    CONSTRAINT [PK_ka_dp010f_IdDp010f] PRIMARY KEY CLUSTERED ([IdDp010f] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp010f_IdKodKorpus_ka_dp25_id] FOREIGN KEY ([IdKodKorpus]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp010f_IdKodStopien_ka_dp25_id] FOREIGN KEY ([IdKodStopien]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp010f_IdKodTrybMian_ka_dp25_id] FOREIGN KEY ([IdKodTrybMian]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp010f_IdPrac_ka_dp001_IdPrac] FOREIGN KEY ([IdPrac]) REFERENCES [her].[ka_dp001] ([IdPrac])
);


GO
CREATE NONCLUSTERED INDEX [IX_ka_dp010f_IdPrac]
    ON [her].[ka_dp010f]([IdPrac] ASC)
    ON [FG_HER];

