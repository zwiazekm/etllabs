CREATE TABLE [zc].[PWD_DokumentWymagany] (
    [IdDok]          BIGINT       NOT NULL,
    [IdPozycji]      SMALLINT     NOT NULL,
    [KodDokWym]      VARCHAR (4)  NULL,
    [KodDokWymPid]   INT          NULL,
    [NrDokWym]       VARCHAR (35) NULL,
    [IdPozycjiTowar] SMALLINT     NOT NULL,
    CONSTRAINT [PK_PWD_DokumentWymagany] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiTowar] ASC)
);

