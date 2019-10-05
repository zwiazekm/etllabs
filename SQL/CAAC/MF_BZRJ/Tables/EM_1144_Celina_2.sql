﻿CREATE TABLE [MF\BZRJ].[EM_1144_Celina_2] (
    [Nr zgłoszenia]                        VARCHAR (40)    NULL,
    [Data przyjęcia]                       VARCHAR (10)    NULL,
    [2.Nadawca: REGON]                     VARCHAR (14)    NULL,
    [2.Nadawca: TIN]                       VARCHAR (12)    NULL,
    [Nadawca: Pesel]                       VARCHAR (11)    NULL,
    [2.Nadawca: Firma]                     VARCHAR (35)    NULL,
    [2.Nadawca: Ulica]                     VARCHAR (35)    NULL,
    [2.Nadawca: Kod pocztowy]              VARCHAR (9)     NULL,
    [2.Nadawca: Miejscowość]               VARCHAR (35)    NULL,
    [2.Nadawca: Kraj]                      VARCHAR (2)     NULL,
    [8.Odbiorca: REGON]                    VARCHAR (14)    NULL,
    [8.Odbiorca: TIN]                      VARCHAR (12)    NULL,
    [8.Odbiorca: Pesel]                    VARCHAR (11)    NULL,
    [8.Odbiorca: Firma]                    VARCHAR (35)    NULL,
    [8.Odbiorca: Ulica]                    VARCHAR (35)    NULL,
    [8.Odbiorca: Kod pocztowy]             VARCHAR (9)     NULL,
    [8.Odbiorca: Miejscowość]              VARCHAR (35)    NULL,
    [8.Odbiorca: Kraj]                     VARCHAR (2)     NULL,
    [14.Zgłaszający: REGON]                VARCHAR (14)    NULL,
    [14.Zgłaszajacy: NIP]                  VARCHAR (12)    NULL,
    [14.Zgłaszajacy: Firma]                VARCHAR (35)    NULL,
    [14.Zgłaszajacy: Ulica]                VARCHAR (35)    NULL,
    [14.Zgłaszający: Kod pocztowy]         VARCHAR (9)     NULL,
    [14.Zgłaszający: Miejscowość]          VARCHAR (35)    NULL,
    [14.Zgłaszający: Kraj]                 VARCHAR (2)     NULL,
    [15.Kraj wysyłki]                      VARCHAR (2)     NULL,
    [20.Kod warunków dostawy]              VARCHAR (3)     NULL,
    [22.Waluta]                            VARCHAR (3)     NULL,
    [22.Wartość faktury]                   DECIMAL (17, 2) NULL,
    [23.Kurs waluty]                       DECIMAL (10, 4) NULL,
    [21.Znaki śr. transp. przekr. granicę] VARCHAR (27)    NULL,
    [21.Kraj śr. transp. przekr. granicę]  VARCHAR (2)     NULL,
    [25.Rodz. śr. transp. przekr. granicę] CHAR (1)        NULL,
    [18.Znaki śr. transp. wewn.]           VARCHAR (27)    NULL,
    [18.Kraj śr. transp. wewn.]            VARCHAR (2)     NULL,
    [26.Rodz. śr. transp. wewn.]           CHAR (1)        NULL,
    [31.Opis towaru]                       VARCHAR (1000)  NULL,
    [Samochód: Marka]                      VARCHAR (3)     NULL,
    [Samochód: VIN]                        VARCHAR (35)    NULL,
    [Samochód: Rok produkcji]              INT             NULL,
    [32.Nr pozycji]                        SMALLINT        NULL,
    [33.Kod CN]                            VARCHAR (8)     NULL,
    [34.Kraj pochodzenia]                  VARCHAR (2)     NULL,
    [Kraj przeznaczenia]                   VARCHAR (2)     NULL,
    [37.Procedura]                         VARCHAR (4)     NULL,
    [38.Masa netto kg]                     DECIMAL (14, 3) NULL,
    [Masa brutto]                          DECIMAL (14, 3) NULL,
    [41.Ilość w uz. jm.]                   DECIMAL (14, 3) NULL,
    [42.Wartość pozycji]                   DECIMAL (17, 2) NULL,
    [46.Wartość statystyczna PLN]          BIGINT          NULL
);

