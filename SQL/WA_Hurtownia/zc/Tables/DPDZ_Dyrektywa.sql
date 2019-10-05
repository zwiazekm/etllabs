CREATE TABLE [zc].[DPDZ_Dyrektywa] (
    [IdDok]                BIGINT         NOT NULL,
    [IdPozycji]            SMALLINT       NOT NULL,
    [IdProfilu]            VARCHAR (6)    NULL,
    [Autor]                VARCHAR (255)  NULL,
    [RodzajDyrektywy]      CHAR (1)       NULL,
    [RodzajDyrektywyPid]   INT            NULL,
    [Parametr]             VARCHAR (255)  NULL,
    [Tresc]                VARCHAR (1024) NULL,
    [Adresat]              VARCHAR (16)   NULL,
    [Status]               CHAR (1)       NULL,
    [Komentarz]            VARCHAR (512)  NULL,
    [KomentarzDyspozytora] VARCHAR (512)  NULL,
    CONSTRAINT [PK_DPDZ_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_RodzajDyrektywyPid] FOREIGN KEY ([RodzajDyrektywyPid]) REFERENCES [pdr].[s100] ([s100_id]),
    CONSTRAINT [FK_DPDZ_Dyrektywa_IdDok_DPDZ_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DPDZ_Dokument] ([IdDok])
);

