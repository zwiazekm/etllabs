CREATE TABLE [zc].[SAD_Korekta] (
    [IdDok]            BIGINT          NOT NULL,
    [IdPozycji]        SMALLINT        NOT NULL,
    [IdPozycjiKorekta] SMALLINT        NOT NULL,
    [KodKorekty]       VARCHAR (5)     NULL,
    [KodKorektyPid]    INT             NULL,
    [Wartosc]          DECIMAL (17, 2) NULL,
    CONSTRAINT [PK_SAD_Korekta] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKorekta] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Korekta_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_Korekta_KodKorektyPid] FOREIGN KEY ([KodKorektyPid]) REFERENCES [pdr].[s087] ([s087_id])
);

