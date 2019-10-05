CREATE TABLE [zc].[DT_Podmiot] (
    [IdPodmiotu]     VARCHAR (30)  NOT NULL,
    [RodzajPodmiotu] VARCHAR (2)   NULL,
    [Nazwa]          VARCHAR (255) NULL,
    [Kraj]           VARCHAR (40)  NULL,
    [KodPocztowy]    VARCHAR (10)  NULL,
    [Miejscowosc]    VARCHAR (60)  NULL,
    [Adres]          VARCHAR (80)  NULL,
    [NIP]            VARCHAR (20)  NULL,
    [REGON]          VARCHAR (20)  NULL,
    [PESEL]          VARCHAR (20)  NULL,
    [NrDowodu]       VARCHAR (30)  NULL,
    [Bnazwa]         VARCHAR (80)  NULL,
    [Bkonto]         VARCHAR (60)  NULL,
    [IdKntr]         INT           NOT NULL,
    [QuasiId]        INT           NULL,
    CONSTRAINT [PK_DT_Podmiot] PRIMARY KEY CLUSTERED ([IdPodmiotu] ASC)
);

