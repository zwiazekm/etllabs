CREATE TABLE [zc].[PWD_DokumentPoprzedni] (
    [IdDok]          BIGINT       NOT NULL,
    [IdPozycji]      SMALLINT     NOT NULL,
    [KodDokPoprz]    VARCHAR (3)  NULL,
    [KodDokPoprzPid] INT          NULL,
    [NrDokPoprz]     VARCHAR (35) NULL,
    [NrCelina]       VARCHAR (25) NULL,
    [IdPozycjiTowar] SMALLINT     NOT NULL,
    CONSTRAINT [PK_PWD_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiTowar] ASC)
);

