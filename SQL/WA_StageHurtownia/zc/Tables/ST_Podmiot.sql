CREATE TABLE [zc].[ST_Podmiot] (
    [IdDok]          VARCHAR (30)  NOT NULL,
    [Typ]            VARCHAR (10)  NOT NULL,
    [IdPozycji]      INT           NOT NULL,
    [RodzajPodmiotu] CHAR (2)      NULL,
    [Nazwa]          VARCHAR (255) NULL,
    [Kraj]           VARCHAR (40)  NULL,
    [KodPoczt]       VARCHAR (10)  NULL,
    [Miejscowosc]    VARCHAR (60)  NULL,
    [Adres]          VARCHAR (80)  NULL,
    [NIP]            VARCHAR (20)  NULL,
    [REGON]          VARCHAR (20)  NULL,
    [PESEL]          VARCHAR (20)  NULL,
    [NrDowodu]       VARCHAR (30)  NULL,
    [BNazwa]         VARCHAR (80)  NULL,
    [BKonto]         VARCHAR (60)  NULL,
    CONSTRAINT [PK_ST_Podmiot] PRIMARY KEY CLUSTERED ([IdDok] ASC, [Typ] ASC, [IdPozycji] ASC)
);

