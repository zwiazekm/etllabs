CREATE TABLE [zc].[SAD_DokumentPoprzedni] (
    [IdDok]             BIGINT       NOT NULL,
    [IdPozycji]         SMALLINT     NOT NULL,
    [IdPozycjiDokPoprz] SMALLINT     NOT NULL,
    [Kategoria]         CHAR (1)     NULL,
    [KategoriaPid]      INT          NULL,
    [KodDokPoprz]       CHAR (3)     NULL,
    [KodDokPoprzPid]    INT          NULL,
    [TypSAD]            CHAR (2)     NULL,
    [TypSADPid]         INT          NULL,
    [NrDokPoprz]        VARCHAR (35) NULL,
    [NrCelina]          VARCHAR (25) NULL,
    CONSTRAINT [PK_SAD_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiDokPoprz] ASC)
);

