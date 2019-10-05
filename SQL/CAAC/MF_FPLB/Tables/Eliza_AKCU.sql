﻿CREATE TABLE [MF\FPLB].[Eliza_AKCU] (
    [NIP lub PESEL podatnika]                     NVARCHAR (500)  NULL,
    [Czy obcokrajowiec]                           NVARCHAR (5)    NULL,
    [Nr podatnika]                                NVARCHAR (32)   NULL,
    [REGON]                                       NVARCHAR (4000) NULL,
    [Rodzaj podatnika]                            NVARCHAR (16)   NULL,
    [Nazwa podatnika]                             NVARCHAR (255)  NULL,
    [Nazwisko podatnika]                          NVARCHAR (255)  NULL,
    [Imię podatnika]                              NVARCHAR (255)  NULL,
    [Kraj]                                        NVARCHAR (4000) NULL,
    [Województwo]                                 NVARCHAR (4000) NULL,
    [Powiat]                                      NVARCHAR (4000) NULL,
    [Gmina]                                       NVARCHAR (4000) NULL,
    [Ulica]                                       NVARCHAR (4000) NULL,
    [Nr nieruchomości]                            NVARCHAR (4000) NULL,
    [Nr lokalu]                                   NVARCHAR (4000) NULL,
    [Miejscowość]                                 NVARCHAR (4000) NULL,
    [Kod pocztowy]                                NVARCHAR (4000) NULL,
    [Poczta]                                      NVARCHAR (4000) NULL,
    [Nr dokumentu]                                NVARCHAR (255)  NULL,
    [Status dokumentu]                            NVARCHAR (4000) NULL,
    [Nr VAT UE]                                   NVARCHAR (4000) NULL,
    [Deklaracja za okres]                         NVARCHAR (7)    NULL,
    [Zarachowanie]                                NVARCHAR (5)    NULL,
    [Powód zarachowania]                          NVARCHAR (4000) NULL,
    [Urząd celny]                                 NVARCHAR (255)  NULL,
    [Deklaracja czy korekta]                      INT             NULL,
    [Data złozenia dokumentu]                     CHAR (10)       NULL,
    [Nr dokumentu pierwotnego]                    NVARCHAR (255)  NULL,
    [Uzasadnienie korekty]                        NVARCHAR (4000) NULL,
    [Rodzaj korekty]                              NVARCHAR (32)   NULL,
    [Data doręczenia korekty z urzędu]            DATETIME2 (7)   NULL,
    [Data wniesienia sprzeciwu]                   DATETIME2 (7)   NULL,
    [Czy sprzeciw do korekty z urzędu]            NVARCHAR (5)    NULL,
    [Razem kwota podatku]                         DECIMAL (19, 2) NULL,
    [Zwolnienia/obniżenia]                        DECIMAL (19, 2) NULL,
    [Kwota podatku po obniżeniach]                DECIMAL (19, 4) NULL,
    [Do zapłaty]                                  DECIMAL (19, 2) NULL,
    [Imię pełnomocnika]                           NVARCHAR (4000) NULL,
    [Nazwisko pełnomocnika]                       NVARCHAR (4000) NULL,
    [Telefon podatnika lub pełnomocnika]          NVARCHAR (4000) NULL,
    [E-mail Podatnika lub pełnomocnika]           NVARCHAR (4000) NULL,
    [Uwagi urzędu celnego]                        NVARCHAR (4000) NULL,
    [Data złożenia deklaracji pierwotnej]         CHAR (10)       NULL,
    [Czy ostatnia wersja deklaracji]              NVARCHAR (5)    NULL,
    [Nazwa grupy wyrobów]                         NVARCHAR (4000) NULL,
    [Opis towaru]                                 NVARCHAR (4000) NULL,
    [Data powstania obowiązku podtakowego]        CHAR (10)       NULL,
    [Termin płatności]                            INT             NULL,
    [Data płatności]                              CHAR (10)       NULL,
    [Marka]                                       NVARCHAR (32)   NULL,
    [Model]                                       NVARCHAR (32)   NULL,
    [Rok produkcji]                               NVARCHAR (255)  NULL,
    [Pojazd elektryczny]                          NVARCHAR (5)    NULL,
    [Pojemność skokowa silnika]                   DECIMAL (19, 4) NULL,
    [Niestandardowy nr VIN]                       NVARCHAR (5)    NULL,
    [VIN]                                         NVARCHAR (255)  NULL,
    [Informacje dodatkowe]                        NVARCHAR (4000) NULL,
    [Kod CN]                                      NVARCHAR (255)  NULL,
    [Podstawa obliczenia podatku/Wartość wyrobów] DECIMAL (19, 4) NULL,
    [Stawka podatku (procent)]                    DECIMAL (19, 4) NULL,
    [Stawka podatku (kwota)]                      DECIMAL (19, 4) NULL,
    [Kwota podatku]                               DECIMAL (19, 2) NULL
);

