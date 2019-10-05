CREATE TABLE [tmp].[struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran] (
    [id]                INT             IDENTITY (1, 1) NOT NULL,
    [nip_zobowiazanego] VARCHAR (10)    NULL,
    [RokMc]             INT             NULL,
    [kod_towarowy]      VARCHAR (8)     NULL,
    [kraj_pochodzenia]  CHAR (2)        NULL,
    [kraj_przezn_wysyl] CHAR (2)        NULL,
    [ile_poz]           INT             NULL,
    [rodzaj_transakcji] CHAR (2)        NULL,
    [typ]               CHAR (1)        NULL,
    [wartosc_faktury]   NUMERIC (15)    NULL,
    [wartosc_stat]      NUMERIC (15)    NULL,
    [masa_netto]        NUMERIC (11)    NULL,
    [uzup_jm]           NUMERIC (11)    NULL,
    [cena_za_kilogram]  NUMERIC (15, 6) NULL,
    [cena_za_sztuke]    NUMERIC (15, 6) NULL,
    CONSTRAINT [PK_struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_struktura_towarowa_suma_pozycji]
    ON [tmp].[struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran]([typ] ASC, [nip_zobowiazanego] ASC, [RokMc] ASC);


GO
CREATE NONCLUSTERED INDEX [struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran_kod_towarowy]
    ON [tmp].[struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran]([kod_towarowy] ASC);

