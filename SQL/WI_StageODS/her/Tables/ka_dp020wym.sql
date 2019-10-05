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
    CONSTRAINT [PK_ka_dp020wym_IdDp020wym] PRIMARY KEY CLUSTERED ([IdDp020wym] ASC)
);

