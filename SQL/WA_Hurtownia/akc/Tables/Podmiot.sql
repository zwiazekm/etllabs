CREATE TABLE [akc].[Podmiot] (
    [IdKomorki]   VARCHAR (20)  NOT NULL,
    [IdPodmiotu]  INT           NOT NULL,
    [NIP]         VARCHAR (20)  NULL,
    [REGON]       VARCHAR (20)  NULL,
    [PESEL]       VARCHAR (20)  NULL,
    [PelnaNazwa]  VARCHAR (255) NULL,
    [Ulica]       VARCHAR (40)  NULL,
    [NumerDomu]   CHAR (6)      NULL,
    [NumerLokalu] CHAR (4)      NULL,
    [KodPocztowy] CHAR (6)      NULL,
    [Miejscowosc] VARCHAR (60)  NULL,
    [Wojewodztwo] VARCHAR (40)  NULL,
    CONSTRAINT [PK_Podmiot] PRIMARY KEY CLUSTERED ([IdKomorki] ASC, [IdPodmiotu] ASC) ON [FG_AKC]
);

