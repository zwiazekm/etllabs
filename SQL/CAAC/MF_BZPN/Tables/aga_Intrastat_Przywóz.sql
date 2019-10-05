CREATE TABLE [MF\BZPN].[aga_Intrastat_Przywóz] (
    [nip]                 NVARCHAR (10)  NULL,
    [regon]               NVARCHAR (14)  NULL,
    [nazwa]               NVARCHAR (255) NULL,
    [ulica]               NVARCHAR (55)  NULL,
    [nr_dom]              NVARCHAR (12)  NULL,
    [nr_lok]              NVARCHAR (5)   NULL,
    [kod_poczt]           NVARCHAR (50)  NULL,
    [miejscowosc]         NVARCHAR (50)  NULL,
    [Towar]               NVARCHAR (8)   NULL,
    [przeznaczenie_wywoz] NVARCHAR (2)   NULL,
    [MAsa]                NUMERIC (38)   NULL,
    [Ilość]               NUMERIC (38)   NULL
);

