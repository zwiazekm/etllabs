CREATE TABLE [tr].[KontrolaOpakowan] (
    [SID]                                    INT         NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT         NULL,
    [IDTypuOpakowania]                       CHAR (2)    NULL,
    [KodPoziomuKontroli]                     CHAR (1)    NULL,
    [LiczbaOpakowan]                         DECIMAL (5) NULL,
    [LiczbaSztuk]                            DECIMAL (5) NULL,
    CONSTRAINT [PK_KontrolaOpakowan] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_KontrolaOpakowan_IDTypuOpakowania_TypyOpakowan_IDTypuOpakowania] FOREIGN KEY ([IDTypuOpakowania]) REFERENCES [tr].[TypyOpakowan] ([Id]),
    CONSTRAINT [FK_KontrolaOpakowan_SIDPozycjiTowarowejOperacjiTranzytowej_SzczegolySkontrolowanejPozycji_SID] FOREIGN KEY ([SIDPozycjiTowarowejOperacjiTranzytowej]) REFERENCES [tr].[SzczegolySkontrolowanejPozycji] ([SID])
);

