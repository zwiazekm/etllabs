CREATE TABLE [zc].[DPDZ_DokumentWymagany] (
    [IdDok]                BIGINT       NOT NULL,
    [IdPozycji]            SMALLINT     NOT NULL,
    [IdPozycjiDokWymagany] SMALLINT     NOT NULL,
    [KodDokWym]            VARCHAR (4)  NULL,
    [KodDokWymPid]         INT          NULL,
    [NrDokWym]             VARCHAR (35) NULL,
    CONSTRAINT [PK_DPDZ_DokumentWymagany] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiDokWymagany] ASC)
);

