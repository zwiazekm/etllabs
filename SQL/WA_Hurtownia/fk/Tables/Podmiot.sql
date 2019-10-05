CREATE TABLE [fk].[Podmiot] (
    [IdPodmiotu]     INT           NOT NULL,
    [IdKomorki]      VARCHAR (20)  NOT NULL,
    [Gmina]          VARCHAR (40)  NULL,
    [KodPocztowy]    CHAR (6)      NULL,
    [Kraj]           VARCHAR (40)  NULL,
    [Miejscowosc]    VARCHAR (60)  NULL,
    [NazwaKrotka]    VARCHAR (40)  NULL,
    [NazwaPelna]     VARCHAR (255) NULL,
    [NIP]            VARCHAR (20)  NULL,
    [NumerDomu]      CHAR (6)      NULL,
    [NumerLokalu]    CHAR (4)      NULL,
    [NumerPaszportu] VARCHAR (20)  NULL,
    [PESEL]          VARCHAR (20)  NULL,
    [Powiat]         VARCHAR (60)  NULL,
    [REGON]          VARCHAR (20)  NULL,
    [RodzajPodmiotu] CHAR (1)      NULL,
    [Ulica]          VARCHAR (40)  NULL,
    [Wojewodztwo]    VARCHAR (40)  NULL,
    CONSTRAINT [PK_Podmiot] PRIMARY KEY CLUSTERED ([IdPodmiotu] ASC, [IdKomorki] ASC) ON [FG_FK]
);

