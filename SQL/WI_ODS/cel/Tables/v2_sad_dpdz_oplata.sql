CREATE TABLE [cel].[v2_sad_dpdz_oplata] (
    [idDokNr]      BIGINT          NOT NULL,
    [PozId]        SMALLINT        NOT NULL,
    [Oplata_PozId] SMALLINT        NOT NULL,
    [Typ]          VARCHAR (3)     NULL,
    [Podstawa]     DECIMAL (17, 2) NULL,
    [Stawka]       DECIMAL (7, 2)  NULL,
    [Kwota]        DECIMAL (17, 2) NULL,
    [MP]           CHAR (1)        NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_OPLATA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Oplata_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_D_OPLAT_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

