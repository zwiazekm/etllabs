CREATE TABLE [zc].[SAD_Opakowanie] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [IdPozycjiOpakowanie] SMALLINT     NOT NULL,
    [RodzajOpakKod]       CHAR (2)     NULL,
    [RodzajOpakKodPid]    INT          NULL,
    [ZnakiOpak]           VARCHAR (42) NULL,
    [LiczbaOpak]          INT          NULL,
    [IloscSztuk]          INT          NULL,
    CONSTRAINT [PK_SAD_Opakowanie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiOpakowanie] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Opakowanie_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_Opakowanie_RodzajOpakKodPid] FOREIGN KEY ([RodzajOpakKodPid]) REFERENCES [pdr].[s033] ([s033_id])
);

