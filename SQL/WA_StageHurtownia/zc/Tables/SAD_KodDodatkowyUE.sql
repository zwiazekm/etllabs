CREATE TABLE [zc].[SAD_KodDodatkowyUE] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodUE] SMALLINT    NOT NULL,
    [KodUE]             VARCHAR (4) NULL,
    [KodUEPid]          INT         NULL,
    CONSTRAINT [PK_SAD_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodUE] ASC)
);

