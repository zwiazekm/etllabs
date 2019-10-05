CREATE TABLE [cel].[v2_dok_dyrektywy] (
    [idDokNr]              BIGINT         NOT NULL,
    [PozId]                SMALLINT       NOT NULL,
    [IdProfilu]            VARCHAR (6)    NULL,
    [AutorProfilu]         VARCHAR (255)  NULL,
    [Rodzaj]               CHAR (1)       NULL,
    [Parametr]             VARCHAR (255)  NULL,
    [Pozycja]              DECIMAL (3)    NULL,
    [Tresc]                VARCHAR (1024) NULL,
    [Adresat]              VARCHAR (16)   NULL,
    [Status]               CHAR (1)       NULL,
    [Komentarz]            VARCHAR (512)  NULL,
    [PobranoProbki]        BIT            NULL,
    [KomentarzDyspozytora] VARCHAR (512)  NULL,
    [CzasKontroli]         DATETIME       NULL,
    [UwagiDlaPodmiotu]     VARCHAR (255)  NULL,
    CONSTRAINT [PK_V2_DOK_DYREKTYWY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DYREKT_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

