﻿CREATE TABLE [MF\BZRJ].[EM_907_ECS_EXT_Tabak] (
    [Data przyjęcia zgłoszenia]                 CHAR (10)       NULL,
    [Numer MRN]                                 NVARCHAR (35)   NULL,
    [Data przyjęcia w UC Wywozu]                CHAR (10)       NULL,
    [Data zwolnienia w UC Wywozu]               CHAR (10)       NULL,
    [UC Wywozu]                                 NVARCHAR (8)    NULL,
    [Deklarowany UC Wyprowadzenia]              NVARCHAR (8)    NULL,
    [Obsługujący UC Wyprowadzenia]              NVARCHAR (8)    NULL,
    [Obsługujacy UC Wyprowadzenia zmieniony na] NVARCHAR (8)    NULL,
    [Kraj wysyłki]                              NVARCHAR (2)    NULL,
    [Kraj przeznaczenia]                        NVARCHAR (2)    NULL,
    [Kontenery]                                 TINYINT         NULL,
    [Masa brutto w kg]                          NUMERIC (18, 3) NULL,
    [Masa brutto granica]                       NUMERIC (18, 3) NULL,
    [Termin dotarcia do UC Wyprowadzenia]       CHAR (10)       NULL,
    [Nadawca: NIP]                              NVARCHAR (17)   NULL,
    [Nadawca: Firma]                            NVARCHAR (105)  NULL,
    [Nadawca: Adres]                            NVARCHAR (105)  NULL,
    [Nadawca: Miejscowość]                      NVARCHAR (105)  NULL,
    [Nadawca: Kod pocztowy]                     NVARCHAR (9)    NULL,
    [Nadawca: Kraj]                             NVARCHAR (2)    NULL,
    [Nadawca towaru: TIN]                       NVARCHAR (17)   NULL,
    [Nadawca towaru: firma ]                    NVARCHAR (105)  NULL,
    [Nadawca towaru: Adres]                     NVARCHAR (105)  NULL,
    [Nadawca towaru: kod poczt.]                NVARCHAR (9)    NULL,
    [Nadawca towaru: Miejscowość]               NVARCHAR (105)  NULL,
    [Nadawca towaru: Kraj]                      NVARCHAR (2)    NULL,
    [Odbiorca: NIP]                             NVARCHAR (17)   NULL,
    [Odbiorca: Firma]                           NVARCHAR (105)  NULL,
    [Odbiorca: Adres]                           NVARCHAR (105)  NULL,
    [Odbiorca: Miejscowość]                     NVARCHAR (105)  NULL,
    [Odbiorca: Kod pocztowy]                    NVARCHAR (9)    NULL,
    [Odbiorca: Kraj]                            NVARCHAR (2)    NULL,
    [Odbiorca towaru: TIN]                      NVARCHAR (17)   NULL,
    [Odbiorca towaru: firma]                    NVARCHAR (105)  NULL,
    [Odbiorca towaru: Adres]                    NVARCHAR (105)  NULL,
    [Odbiorca towaru: Kod poczt.]               NVARCHAR (9)    NULL,
    [Odbiorca towaru: Miejscowość]              NVARCHAR (105)  NULL,
    [Odbiorca towaru: Kraj]                     NVARCHAR (2)    NULL,
    [Przedstawiający: NIP]                      NVARCHAR (17)   NULL,
    [Przedstawiający: Firma]                    NVARCHAR (105)  NULL,
    [Przedstawiający: Adres]                    NVARCHAR (105)  NULL,
    [Przedstawiający: Miejscowość]              NVARCHAR (105)  NULL,
    [Przedstawiający: Kod pocztowy]             NVARCHAR (9)    NULL,
    [Przedstawiający: Kraj]                     NVARCHAR (2)    NULL,
    [Znaki śr. transp. wewnętrznego]            NVARCHAR (765)  NULL,
    [Znaki śr. transp. na granicy]              NVARCHAR (255)  NULL,
    [Nr pozycji]                                INT             NULL,
    [Kod towaru]                                NVARCHAR (22)   NULL,
    [Kod CN]                                    NVARCHAR (8)    NULL,
    [Opis towaru]                               NVARCHAR (840)  NULL,
    [Wartość statystyczna]                      NUMERIC (17, 2) NULL,
    [Waluta]                                    NVARCHAR (3)    NULL,
    [Masa brutto pozycji w kg]                  NUMERIC (18, 3) NULL,
    [Masa brutto pozycji na granicy w kg]       NUMERIC (18, 3) NULL,
    [Masa netto pozycji w kg]                   NUMERIC (18, 3) NULL,
    [Masa netto pozycji na granicy w kg]        NUMERIC (18, 3) NULL
);

