CREATE TABLE [ncts2].[ref_podmioty] (
    [id]                 BIGINT         NOT NULL,
    [idsisc]             NVARCHAR (17)  NULL,
    [numereori]          NVARCHAR (17)  NULL,
    [imie]               NVARCHAR (60)  NULL,
    [nazwisko]           NVARCHAR (90)  NULL,
    [nazwa_pelna]        NVARCHAR (300) NULL,
    [nazwa_skrocona]     NVARCHAR (35)  NULL,
    [adres_ulica]        NVARCHAR (100) NULL,
    [adres_kod_pocztowy] NVARCHAR (9)   NULL,
    [adres_miejscowosc]  NVARCHAR (52)  NULL,
    [adres_kod_kraju]    NVARCHAR (2)   NULL,
    [adres_kod_jezyka]   NVARCHAR (2)   NULL,
    [adres_telefon]      NVARCHAR (35)  NULL,
    [adres_fax]          NVARCHAR (50)  NULL,
    [adres_email]        NVARCHAR (70)  NULL,
    [data_od]            DATETIME       NULL,
    [data_do]            DATETIME       NULL,
    CONSTRAINT [ref_podmioty_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

