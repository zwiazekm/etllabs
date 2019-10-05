CREATE TABLE [tr].[DokumentySkontrolowanejPozycji] (
    [SID]                               INT         NOT NULL,
    [SIDSkontrolowanejPozycjiTowarowej] INT         NULL,
    [IDTypuDokumentu]                   VARCHAR (6) NULL,
    CONSTRAINT [PK_DokumentySkontrolowanejPozycji] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_DokumentySkontrolowanejPozycji_IDTypuDokumentu_TypyDokumentow_ID] FOREIGN KEY ([IDTypuDokumentu]) REFERENCES [tr].[TypyDokumentow] ([Id]),
    CONSTRAINT [FK_DokumentySkontrolowanejPozycji_SIDSkontrolowanejPozycjiTowarowej_SzczegolySkontrolowanejPozycji_SID] FOREIGN KEY ([SIDSkontrolowanejPozycjiTowarowej]) REFERENCES [tr].[SzczegolySkontrolowanejPozycji] ([SID])
);

