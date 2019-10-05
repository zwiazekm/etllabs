CREATE TABLE [zc].[SAD_Podklasyfikacja] (
    [IdDok]                    BIGINT   NOT NULL,
    [IdPozycji]                SMALLINT NOT NULL,
    [IdPozycjiPodklasyfikacja] SMALLINT NOT NULL,
    CONSTRAINT [PK_SAD_Podklasyfikacja] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiPodklasyfikacja] ASC)
);

