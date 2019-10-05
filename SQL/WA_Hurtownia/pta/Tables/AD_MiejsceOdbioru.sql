CREATE TABLE [pta].[AD_MiejsceOdbioru] (
    [Id]          BIGINT         NOT NULL,
    [PodmiotNRA]  VARCHAR (13)   NOT NULL,
    [Nazwa]       NVARCHAR (300) NULL,
    [NrAkcyzowy]  NVARCHAR (13)  NULL,
    [UCKontroli]  VARCHAR (8)    NULL,
    [KodKraju]    CHAR (2)       NOT NULL,
    [Ulica]       NVARCHAR (70)  NULL,
    [NrDomu]      NVARCHAR (10)  NOT NULL,
    [NrLokalu]    NVARCHAR (10)  NULL,
    [Miejscowosc] NVARCHAR (60)  NULL,
    [KodPocztowy] NVARCHAR (10)  NOT NULL,
    [Poczta]      NVARCHAR (60)  NULL,
    [PodmiotTyp]  VARCHAR (5)    NOT NULL,
    CONSTRAINT [PK_AD_MiejsceOdbioru] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_MiejsceOdbioru_PodmiotNRAPodmiotTyp_AD_Podmiot_NRATyp] FOREIGN KEY ([PodmiotNRA], [PodmiotTyp]) REFERENCES [pta].[AD_Podmiot] ([NRA], [Typ])
);

