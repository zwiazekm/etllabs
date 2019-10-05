CREATE TABLE [zc].[DPDZ_Towar] (
    [IdDok]                   BIGINT          NOT NULL,
    [IdPozycji]               SMALLINT        NOT NULL,
    [OpisTowaru]              VARCHAR (1000)  NULL,
    [KodTowarowy]             VARCHAR (8)     NULL,
    [KodTowarowyPid]          INT             NULL,
    [KodTaric]                CHAR (2)        NULL,
    [KrajPochodzenia]         CHAR (2)        NULL,
    [KrajPochodzeniaPid]      INT             NULL,
    [Preferencje]             CHAR (3)        NULL,
    [MasaNetto]               DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJm]    DECIMAL (14, 3) NULL,
    [CzyTowarStrategiczny]    BIT             NULL,
    [WartoscPozycji]          DECIMAL (17, 2) NULL,
    [MetodaWartosciowania]    CHAR (1)        NULL,
    [MetodaWartosciowaniaPid] INT             NULL,
    [WartoscStatystyczna]     BIGINT          NULL,
    CONSTRAINT [PK_DPDZ_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

