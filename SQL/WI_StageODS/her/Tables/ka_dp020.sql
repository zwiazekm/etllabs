CREATE TABLE [her].[ka_dp020] (
    [RV]                BINARY (8)  NULL,
    [DataZap]           DATETIME    NULL,
    [IdUzZap]           INT         NULL,
    [IdDp020]           INT         NOT NULL,
    [IdPrac]            INT         NOT NULL,
    [IdUmowy]           INT         NOT NULL,
    [DataOd]            DATETIME    NULL,
    [KodGrPrac]         VARCHAR (9) NULL,
    [IdKodGrPrac]       INT         NULL,
    [IdPracodawca]      INT         NULL,
    [IdJednOrg]         INT         NOT NULL,
    [IdKomOrg]          INT         NOT NULL,
    [IdStanEtat]        INT         NOT NULL,
    [IdKomOrgMian]      INT         NULL,
    [IdStan]            INT         NULL,
    [KodPowZmianStan]   VARCHAR (9) NULL,
    [IdKodPowZmianStan] INT         NULL,
    [WskZmianStrOrg]    BIT         NULL,
    [KodPodstPraw]      VARCHAR (9) NULL,
    [IdKodPodstPraw]    INT         NULL,
    CONSTRAINT [PK_ka_dp020_IdDp020] PRIMARY KEY CLUSTERED ([IdDp020] ASC)
);

