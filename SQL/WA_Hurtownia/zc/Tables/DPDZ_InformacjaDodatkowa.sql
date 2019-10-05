CREATE TABLE [zc].[DPDZ_InformacjaDodatkowa] (
    [IdDok]           BIGINT      NOT NULL,
    [IdPozycji]       SMALLINT    NOT NULL,
    [IdPozycjiInfDod] SMALLINT    NOT NULL,
    [KodInfDod]       VARCHAR (5) NULL,
    [KodInfDodPid]    INT         NULL,
    CONSTRAINT [PK_DPDZ_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiInfDod] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_KodInfDodPid] FOREIGN KEY ([KodInfDodPid]) REFERENCES [pdr].[s036] ([s036_id]),
    CONSTRAINT [FK_DPDZ_InformacjaDodatkowa_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

