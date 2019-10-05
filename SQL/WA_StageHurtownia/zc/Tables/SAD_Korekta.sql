CREATE TABLE [zc].[SAD_Korekta] (
    [IdDok]            BIGINT          NOT NULL,
    [IdPozycji]        SMALLINT        NOT NULL,
    [IdPozycjiKorekta] SMALLINT        NOT NULL,
    [KodKorekty]       VARCHAR (5)     NULL,
    [KodKorektyPid]    INT             NULL,
    [Wartosc]          DECIMAL (17, 2) NULL,
    CONSTRAINT [PK_SAD_Korekta] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKorekta] ASC)
);

