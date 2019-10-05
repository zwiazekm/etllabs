CREATE TABLE [tr].[DokumentySkontrolowanejPozycji] (
    [SID]                               INT         NOT NULL,
    [SIDSkontrolowanejPozycjiTowarowej] INT         NULL,
    [IDTypuDokumentu]                   VARCHAR (6) NULL,
    CONSTRAINT [PK_DokumentySkontrolowanejPozycji] PRIMARY KEY CLUSTERED ([SID] ASC)
);

