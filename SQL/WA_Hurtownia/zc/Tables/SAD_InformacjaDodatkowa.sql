CREATE TABLE [zc].[SAD_InformacjaDodatkowa] (
    [IdDok]           BIGINT      NOT NULL,
    [IdPozycji]       SMALLINT    NOT NULL,
    [IdPozycjiInfDod] SMALLINT    NOT NULL,
    [KodInfDod]       VARCHAR (5) NULL,
    [KodInfDodPid]    INT         NULL,
    CONSTRAINT [PK_SAD_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiInfDod] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_InformacjaDodatkowa_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_InformacjaDodatkowa_KodInfDodPid] FOREIGN KEY ([KodInfDodPid]) REFERENCES [pdr].[s036] ([s036_id])
);

