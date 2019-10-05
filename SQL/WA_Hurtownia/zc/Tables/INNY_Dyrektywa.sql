CREATE TABLE [zc].[INNY_Dyrektywa] (
    [IdDok]                 VARCHAR (30)   NOT NULL,
    [AutorProfilu]          VARCHAR (40)   NULL,
    [RodzajDyrektywy]       CHAR (1)       NULL,
    [RodzajDyrektywyPid]    INT            NULL,
    [Adresat]               VARCHAR (16)   NULL,
    [Status]                CHAR (1)       NULL,
    [Tresc]                 VARCHAR (1024) NULL,
    [KomentarzDyspozytora]  VARCHAR (512)  NULL,
    [KomentarzPoRealizacji] VARCHAR (512)  NULL,
    [IdProfilu]             VARCHAR (40)   NULL,
    [NrDyrektywy]           NUMERIC (5)    NOT NULL,
    CONSTRAINT [PK_INNY_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NrDyrektywy] ASC) ON [FG_ZC],
    CONSTRAINT [FK_INNY_Dyrektywa_IdDok_INNY_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[INNY_Dokument] ([IdDok]),
    CONSTRAINT [FK_INNY_Dyrektywa_RodzajDyrektywyPid] FOREIGN KEY ([RodzajDyrektywyPid]) REFERENCES [pdr].[s100] ([s100_id])
);

