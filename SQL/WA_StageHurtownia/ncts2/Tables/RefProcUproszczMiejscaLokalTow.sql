CREATE TABLE [ncts2].[RefProcUproszczMiejscaLokalTow] (
    [Id]                                         BIGINT        NOT NULL,
    [IdPozwoleniaNaProcedureUproszczona]         BIGINT        NULL,
    [NumerMiejsca]                               NVARCHAR (17) NULL,
    [CzasDecyzjeTranzyt]                         INT           NULL,
    [ZgodaPoGodzinachPracyUrzeduUCPrzeznaczenia] BIT           NULL,
    [ZgodaPoGodzinachPracyUrzeduUCWyjscia]       BIT           NULL,
    [KodUrzedu]                                  NVARCHAR (8)  NULL,
    CONSTRAINT [RefProcUproszczMiejscaLokalTow_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

