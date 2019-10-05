CREATE TABLE [tr].[SkontrolowanePozycjeInformacjeDodatkowe] (
    [SID]                        INT         NULL,
    [SIDSkontrolowanejPozycji]   INT         NOT NULL,
    [IDKoduInformacjiDodatkowej] VARCHAR (5) NULL,
    [EksportZEC]                 CHAR (1)    NULL,
    [IDKrajuEksportujacego]      CHAR (2)    NULL,
    [KodPoziomuKontroli]         CHAR (1)    NOT NULL,
    CONSTRAINT [PK_SkontrolowanePozycjeInformacjeDodatkowe] PRIMARY KEY CLUSTERED ([SIDSkontrolowanejPozycji] ASC)
);

