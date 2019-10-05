CREATE TABLE [her].[ka_dp020wym] (
    [RV]                   BINARY (8)  NULL,
    [DataZap]              DATETIME    NULL,
    [IdUzZap]              INT         NULL,
    [IdDp020wym]           INT         NOT NULL,
    [IdPrac]               INT         NOT NULL,
    [IdUmowy]              INT         NOT NULL,
    [DataOd]               DATETIME    NULL,
    [KodWymCzasPrac]       VARCHAR (9) NULL,
    [IdKodWymCzasPrac]     INT         NOT NULL,
    [KodDobNormCzasPrac]   VARCHAR (9) NULL,
    [IdKodDobNormCzasPrac] INT         NULL,
    [DobNormCzasPrac]      SMALLINT    NULL,
    [TygNormCzasPrac]      SMALLINT    NULL,
    [KodPowZmiany]         VARCHAR (9) NULL,
    [IdKodPowZmiany]       INT         NULL,
    CONSTRAINT [PK_ka_dp020wym_IdDp020wym] PRIMARY KEY CLUSTERED ([IdDp020wym] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_dp020wym_IdKodDobNormCzasPrac_ka_dp25_id] FOREIGN KEY ([IdKodDobNormCzasPrac]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020wym_IdKodPowZmiany_ka_dp25_id] FOREIGN KEY ([IdKodPowZmiany]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020wym_IdKodWymCzasPrac_ka_dp25_id] FOREIGN KEY ([IdKodWymCzasPrac]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [FK_ka_dp020wym_IdPrac_ka_dp001_IdPrac] FOREIGN KEY ([IdPrac]) REFERENCES [her].[ka_dp001] ([IdPrac]),
    CONSTRAINT [FK_ka_dp020wym_IdUmowy_ka_dp002_IdUmowy] FOREIGN KEY ([IdUmowy]) REFERENCES [her].[ka_dp002] ([IdUmowy])
);

