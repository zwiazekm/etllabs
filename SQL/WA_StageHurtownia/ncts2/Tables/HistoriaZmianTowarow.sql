CREATE TABLE [ncts2].[HistoriaZmianTowarow] (
    [Id]                      BIGINT          NOT NULL,
    [Wersja]                  INT             NULL,
    [CalkowitaLiczbaSztuk]    INT             NULL,
    [CalkowitaLiczbaOpakowan] INT             NULL,
    [CalkowitaMasaBrutto]     NUMERIC (14, 3) NULL,
    [IdPozycji]               INT             NULL,
    [KodTowarowy]             NVARCHAR (8)    NULL,
    [OpisTowaru]              NVARCHAR (280)  NULL,
    [LiczbaOpakowan]          INT             NULL,
    [LiczbaSztuk]             INT             NULL,
    [IdOperacjiTranzytowej]   BIGINT          NULL,
    [IdKomunikatu]            BIGINT          NULL,
    [MasaBrutto]              NUMERIC (14, 3) NULL,
    CONSTRAINT [HistoriaZmianTowarow_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

