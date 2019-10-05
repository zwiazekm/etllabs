CREATE TABLE [zc].[SAD_KodDodatkowyPL] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodPL] SMALLINT    NOT NULL,
    [KodPL]             VARCHAR (4) NULL,
    [KodPLPid]          INT         NULL,
    CONSTRAINT [PK_SAD_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodPL] ASC)
);

