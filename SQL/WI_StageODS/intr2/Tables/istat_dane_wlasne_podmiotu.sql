CREATE TABLE [intr2].[istat_dane_wlasne_podmiotu] (
    [id_pod]      NVARCHAR (35)  NOT NULL,
    [regon]       NVARCHAR (14)  NULL,
    [nazwa]       NVARCHAR (255) NULL,
    [imie]        NVARCHAR (35)  NULL,
    [nazwisko]    NVARCHAR (35)  NULL,
    [kod_kraj]    NVARCHAR (50)  NULL,
    [kod_gmina]   NVARCHAR (50)  NULL,
    [kod_poczt]   NVARCHAR (8)   NULL,
    [poczta]      NVARCHAR (35)  NULL,
    [miejscowosc] NVARCHAR (35)  NULL,
    [ulica]       NVARCHAR (45)  NULL,
    [nr_dom]      NVARCHAR (9)   NULL,
    [nr_lok]      NVARCHAR (5)   NULL,
    [telefon]     NVARCHAR (35)  NULL,
    [faks]        NVARCHAR (35)  NULL,
    [email]       NVARCHAR (128) NULL,
    [data_wprow]  DATETIME2 (3)  NULL,
    [data_aktual] DATETIME2 (3)  NULL,
    CONSTRAINT [istat_dane_wlasne_podmiotu$PK_istat_dane_wlasne_podmiotu] PRIMARY KEY CLUSTERED ([id_pod] ASC)
);

