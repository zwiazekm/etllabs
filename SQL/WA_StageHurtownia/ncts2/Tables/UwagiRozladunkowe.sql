﻿CREATE TABLE [ncts2].[UwagiRozladunkowe] (
    [Id]                                      BIGINT          NOT NULL,
    [IdOperacjiTranzytowej]                   BIGINT          NULL,
    [Iteracja]                                BIGINT          NULL,
    [DataRozladunku]                          DATETIME        NULL,
    [WynikRozladunkuZakonczenie]              BIT             NULL,
    [WynikRozladunkuZgodny]                   BIT             NULL,
    [WynikRozladunkuZamknieciaPrawidlowe]     BIT             NULL,
    [PodmiotWMiejscuPrzeznaczeniaNazwa]       NVARCHAR (35)   NULL,
    [PodmiotWMiejscuPrzeznaczeniaUlicaNumer]  NVARCHAR (35)   NULL,
    [PodmiotWMiejscuPrzeznaczeniaKodPocztowy] NVARCHAR (9)    NULL,
    [PodmiotWMiejscuPrzeznaczeniaMiejscowosc] NVARCHAR (35)   NULL,
    [PodmiotWMiejscuPrzeznaczeniaKraj]        NVARCHAR (2)    NULL,
    [PodmiotWMiejscuPrzeznaczeniaTIN]         NVARCHAR (17)   NULL,
    [UwagiRozladunkowe]                       NVARCHAR (MAX)  NULL,
    [KarnetTIRNieDotyczy]                     BIT             NULL,
    [NumerStronyKarnetuTIR]                   NVARCHAR (2)    NULL,
    [KarnetTIRTypRozladunku]                  NVARCHAR (1)    NULL,
    [KarnetTIRNumerRozladunku]                NVARCHAR (2)    NULL,
    [Zwolnienie]                              NVARCHAR (1)    NULL,
    [ZamknieciaCelneIlosc]                    BIGINT          NULL,
    [LiczbaPozycji]                           INT             NULL,
    [LiczbaOpakowan]                          INT             NULL,
    [MasaBrutto]                              NUMERIC (14, 3) NULL,
    [TransportZnaki]                          NVARCHAR (27)   NULL,
    [TransportKraj]                           NVARCHAR (2)    NULL,
    [LiczbaPozycjiUwagi]                      NVARCHAR (140)  NULL,
    [MasaBruttoUwagi]                         NVARCHAR (140)  NULL,
    [LiczbaOpakowanUwagi]                     NVARCHAR (140)  NULL,
    [TransportZnakiUwagi]                     NVARCHAR (140)  NULL,
    [TransportKrajUwagi]                      NVARCHAR (140)  NULL,
    [DataUtworzenia]                          DATETIME        NULL,
    CONSTRAINT [UwagiRozladunkowe_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

