CREATE TABLE [zc].[DPDZ_KodDodatkowyUE] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodUE] SMALLINT    NOT NULL,
    [KodUE]             VARCHAR (4) NULL,
    [KodUEPid]          INT         NULL,
    CONSTRAINT [PK_DPDZ_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodUE] ASC)
);

