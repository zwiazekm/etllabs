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
    CONSTRAINT [PK_ka_dp010f_IdDp010f] PRIMARY KEY CLUSTERED ([IdDp010f] ASC)
);

