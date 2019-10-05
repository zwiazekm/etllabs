﻿CREATE TABLE [MF\BZRJ].[EM_907_NCTS2] (
    [Data otwarcia]                           CHAR (10)       NULL,
    [Nr MRN]                                  NVARCHAR (18)   NULL,
    [Typ dokumentu]                           NVARCHAR (5)    NULL,
    [UC wyjścia]                              NVARCHAR (8)    NULL,
    [UC przybycia]                            NVARCHAR (35)   NULL,
    [Dekl UC przybycia]                       NVARCHAR (8)    NULL,
    [UC przeznaczenia]                        NVARCHAR (8)    NULL,
    [Kod kraju wysyłki]                       NVARCHAR (2)    NULL,
    [Kod kraju przeznaczenia]                 NVARCHAR (2)    NULL,
    [Nadawca: TIN]                            NVARCHAR (17)   NULL,
    [Nadawca: Firma]                          NVARCHAR (35)   NULL,
    [Nadawca: Adres]                          NVARCHAR (100)  NULL,
    [Nadawca: Kod pocztowy]                   NVARCHAR (9)    NULL,
    [Nadawca: Miejscowość]                    NVARCHAR (52)   NULL,
    [Nadawca: Kraj]                           NVARCHAR (2)    NULL,
    [Nadawca tow: TIN]                        NVARCHAR (17)   NULL,
    [Nadawca tow: Firma]                      NVARCHAR (35)   NULL,
    [Nadawca tow: Adres]                      NVARCHAR (35)   NULL,
    [Nadawca tow: Kod pocztowy]               NVARCHAR (9)    NULL,
    [Nadawca tow: Miejscowość]                NVARCHAR (35)   NULL,
    [Nadawca tow: Kraj]                       NVARCHAR (2)    NULL,
    [Odbiorca: TIN]                           NVARCHAR (17)   NULL,
    [Odbiorca: Firma]                         NVARCHAR (35)   NULL,
    [Odbiorca: Adres]                         NVARCHAR (100)  NULL,
    [Odbiorca: Kod pocztowy]                  NVARCHAR (9)    NULL,
    [Odbiorca: Miejscowość]                   NVARCHAR (52)   NULL,
    [Odbiorca: Kraj]                          NVARCHAR (2)    NULL,
    [Odbiorca tow: TIN]                       NVARCHAR (17)   NULL,
    [Odbiorca tow: Firma]                     NVARCHAR (35)   NULL,
    [Odbiorca tow: Adres]                     NVARCHAR (35)   NULL,
    [Odbiorca tow: Kod pocztowy]              NVARCHAR (9)    NULL,
    [Odbiorca tow: Miejscowość]               NVARCHAR (35)   NULL,
    [Odbiorca tow: Kraj]                      NVARCHAR (2)    NULL,
    [Gł. zobowiązany: TIN]                    NVARCHAR (17)   NULL,
    [Gł. zobowiązany: Firma]                  NVARCHAR (35)   NULL,
    [Gł. zobowiązany: Adres]                  NVARCHAR (100)  NULL,
    [Gł. zobowiązany: Kod pocztowy]           NVARCHAR (9)    NULL,
    [Gł. zobowiązany: Miejscowość]            NVARCHAR (52)   NULL,
    [Gł. zobowiązany: Kraj]                   NVARCHAR (2)    NULL,
    [Gł. zobow. przedst: TIN]                 NVARCHAR (17)   NULL,
    [Gł. zobow. przedst: Firma]               NVARCHAR (35)   NULL,
    [Gł. zobow. przedst: Adres]               NVARCHAR (100)  NULL,
    [Gł. zobow. przedst: Kod pocztowy]        NVARCHAR (9)    NULL,
    [Gł. zobow. przedst: Miejscowość]         NVARCHAR (52)   NULL,
    [Gł. zobow. przedst: Kraj]                NVARCHAR (2)    NULL,
    [Przedstawiający: TIN]                    NVARCHAR (17)   NULL,
    [Przedstawiający: Firma]                  NVARCHAR (35)   NULL,
    [Przedstawiający: Adres]                  NVARCHAR (100)  NULL,
    [Przedstawiający: Kod pocztowy]           NVARCHAR (9)    NULL,
    [Przedstawiający: Miejscowość]            NVARCHAR (52)   NULL,
    [Przedstawiający: Kraj]                   NVARCHAR (2)    NULL,
    [Przewoźnik: TIN]                         NVARCHAR (17)   NULL,
    [Przewoźnik: Firma]                       NVARCHAR (35)   NULL,
    [Przewoźnik: Adres]                       NVARCHAR (100)  NULL,
    [Przewoźnik: Kod pocztowy]                NVARCHAR (9)    NULL,
    [Przewoźnik: Miejscowość]                 NVARCHAR (52)   NULL,
    [Przewoźnik: Kraj]                        NVARCHAR (2)    NULL,
    [Termin dostawy]                          CHAR (10)       NULL,
    [Data przybycia]                          CHAR (10)       NULL,
    [Data zwolnienia]                         CHAR (10)       NULL,
    [Środek transp. Rodzaj]                   NVARCHAR (2)    NULL,
    [Środek transp. Kraj]                     NVARCHAR (2)    NULL,
    [Środek transp. Znaki]                    NVARCHAR (27)   NULL,
    [Środek transp. na granicy Rodzaj]        NVARCHAR (2)    NULL,
    [Środek transp. na granicy Kraj]          NVARCHAR (2)    NULL,
    [Środek transp. na granicy Znaki]         NVARCHAR (27)   NULL,
    [Kontrola w UC przeznaczenia: Data]       CHAR (10)       NULL,
    [Kontrola w UC wyjścia: Kod]              NVARCHAR (2)    NULL,
    [Kontrola w UC przeznaczenia: zamknięcia] BIT             NULL,
    [Kontrola w UC przeznaczenia: Kod]        NVARCHAR (2)    NULL,
    [Kontrola w UC przeznaczenia: Uwagi]      NVARCHAR (350)  NULL,
    [Kontrola w UC przeznaczenia: Znaki]      NVARCHAR (140)  NULL,
    [Status w UC wyjścia]                     NVARCHAR (8)    NULL,
    [Status w UC przeznaczenia]               NVARCHAR (8)    NULL,
    [Nr pozycji]                              INT             NULL,
    [Opis towaru]                             NVARCHAR (280)  NULL,
    [Kod towaru]                              NVARCHAR (8)    NULL,
    [Masa brutto w kg]                        NUMERIC (14, 3) NULL,
    [Masa netto w kg]                         NUMERIC (14, 3) NULL,
    [Nr gwarancji]                            NVARCHAR (24)   NULL,
    [Odnośnik do gwarancji]                   NVARCHAR (35)   NULL,
    [Typ gwarancji]                           NVARCHAR (1)    NULL,
    [Waluta]                                  NVARCHAR (3)    NULL,
    [Kwota]                                   NUMERIC (15, 2) NULL,
    [Kwota w PLN]                             NUMERIC (15, 2) NULL,
    [Kwota w EUR]                             NUMERIC (15, 2) NULL
);

