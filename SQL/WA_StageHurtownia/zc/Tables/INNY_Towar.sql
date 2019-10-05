CREATE TABLE [zc].[INNY_Towar] (
    [IdDok]          VARCHAR (30)    NOT NULL,
    [IdPozycji]      NUMERIC (2)     NOT NULL,
    [LiczbaOpakowan] NUMERIC (14)    NULL,
    [MasaBrutto]     NUMERIC (14)    NULL,
    [KodTowaru]      VARCHAR (10)    NULL,
    [Procedura]      VARCHAR (4)     NULL,
    [KrajWysylki]    VARCHAR (2)     NULL,
    [OpisTowaru]     VARCHAR (1024)  NULL,
    [KrajPoch]       VARCHAR (2)     NULL,
    [WarTowaru]      NUMERIC (14, 2) NULL,
    [MasaNetto]      NUMERIC (14)    NULL,
    CONSTRAINT [PK_INNY_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

