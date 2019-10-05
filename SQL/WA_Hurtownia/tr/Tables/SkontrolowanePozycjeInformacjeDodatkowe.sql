CREATE TABLE [tr].[SkontrolowanePozycjeInformacjeDodatkowe] (
    [SID]                        INT         NULL,
    [SIDSkontrolowanejPozycji]   INT         NOT NULL,
    [IDKoduInformacjiDodatkowej] VARCHAR (5) NULL,
    [EksportZEC]                 CHAR (1)    NULL,
    [IDKrajuEksportujacego]      CHAR (2)    NULL,
    [KodPoziomuKontroli]         CHAR (1)    NOT NULL,
    CONSTRAINT [PK_SkontrolowanePozycjeInformacjeDodatkowe] PRIMARY KEY CLUSTERED ([SIDSkontrolowanejPozycji] ASC) ON [FG_TR],
    CONSTRAINT [FK_SkontrolowanePozycjeInformacjeDodatkowe_IDKoduInformacjiDodatkowej_KodyInformacjiDodatkowych_IDKoduInformacjiDodatkowej] FOREIGN KEY ([IDKoduInformacjiDodatkowej]) REFERENCES [tr].[KodyInformacjiDodatkowych] ([Id]),
    CONSTRAINT [FK_SkontrolowanePozycjeInformacjeDodatkowe_SIDSkontrolowanejPozycjiTowarowej_SzczegolySkontrolowanejPozycji_SID] FOREIGN KEY ([SIDSkontrolowanejPozycji]) REFERENCES [tr].[SzczegolySkontrolowanejPozycji] ([SID])
);

