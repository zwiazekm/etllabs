CREATE TABLE [emcs2].[AD_MiejsceOdbioru] (
    [Id]          NUMERIC (38)   NOT NULL,
    [PodmiotNRA]  VARCHAR (13)   NOT NULL,
    [Nazwa]       NVARCHAR (900) NULL,
    [NrAkcyzowy]  NVARCHAR (39)  NULL,
    [UCKontroli]  NVARCHAR (24)  NULL,
    [KodKraju]    NVARCHAR (6)   NOT NULL,
    [Ulica]       NVARCHAR (210) NULL,
    [NrDomu]      NVARCHAR (30)  NOT NULL,
    [NrLokalu]    NVARCHAR (30)  NULL,
    [Miejscowosc] NVARCHAR (180) NULL,
    [KodPocztowy] NVARCHAR (30)  NOT NULL,
    [Poczta]      NVARCHAR (180) NULL,
    [PodmiotTyp]  NVARCHAR (15)  NOT NULL,
    CONSTRAINT [AD_MiejsceOdbioru$PK_AD_MiejsceOdbioru] PRIMARY KEY CLUSTERED ([Id] ASC)
);

