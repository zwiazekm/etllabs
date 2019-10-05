﻿CREATE TABLE [ncts2].[wyniki_kontroli] (
    [id]                          BIGINT          NOT NULL,
    [operacja_tranzytowa_id]      BIGINT          NULL,
    [data_kontroli]               DATETIME        NULL,
    [kod_wyniku]                  NVARCHAR (2)    NULL,
    [wyjasnianie_niezgodnosci]    BIT             NULL,
    [zamkniecia_prawidlowe]       BIT             NULL,
    [losowe_typowanie]            BIT             NULL,
    [zwolnienie_bez_zastrzezen]   BIT             NULL,
    [karnet_tir_nie_dotyczy]      BIT             NULL,
    [karnet_tir_numer_strony]     NVARCHAR (2)    NULL,
    [karnet_tir_typ_rozladunku]   NVARCHAR (1)    NULL,
    [karnet_tir_numer_rozladunku] NVARCHAR (2)    NULL,
    [skontrolowal]                NVARCHAR (35)   NULL,
    [uwagi]                       NVARCHAR (350)  NULL,
    [uwagi_jezyk]                 NVARCHAR (2)    NULL,
    [liczba_pozycji]              SMALLINT        NULL,
    [liczba_pozycji_uwagi]        NVARCHAR (140)  NULL,
    [masa_brutto]                 NUMERIC (14, 3) NULL,
    [masa_brutto_uwagi]           NVARCHAR (140)  NULL,
    [liczba_opakowan]             INT             NULL,
    [liczba_opakowan_uwagi]       NVARCHAR (140)  NULL,
    [transport_znaki]             NVARCHAR (140)  NULL,
    [transport_znaki_uwagi]       NVARCHAR (140)  NULL,
    [transport_kraj]              NVARCHAR (2)    NULL,
    [transport_kraj_uwagi]        NVARCHAR (140)  NULL,
    [data_utworzenia]             DATETIME        NULL,
    CONSTRAINT [wyniki_kontroli_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

