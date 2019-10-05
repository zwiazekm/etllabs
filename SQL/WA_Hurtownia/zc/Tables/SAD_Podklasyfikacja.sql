CREATE TABLE [zc].[SAD_Podklasyfikacja] (
    [IdDok]                    BIGINT   NOT NULL,
    [IdPozycji]                SMALLINT NOT NULL,
    [IdPozycjiPodklasyfikacja] SMALLINT NOT NULL,
    CONSTRAINT [PK_SAD_Podklasyfikacja] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiPodklasyfikacja] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Podklasyfikacja_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji])
);

