CREATE TABLE [zc].[DS_Dyrektywa] (
    [IdDok]                BIGINT         NOT NULL,
    [IdPozycji]            SMALLINT       NOT NULL,
    [Autor]                VARCHAR (255)  NULL,
    [RodzajDyrektywy]      CHAR (1)       NULL,
    [RodzajDyrektywyPid]   INT            NULL,
    [Adresat]              VARCHAR (16)   NULL,
    [Status]               CHAR (1)       NULL,
    [Tresc]                VARCHAR (1024) NULL,
    [KomentarzDyspozytora] VARCHAR (512)  NULL,
    [Komentarz]            VARCHAR (512)  NULL,
    [IdProfilu]            VARCHAR (6)    NULL,
    [Parametr]             VARCHAR (255)  NULL,
    CONSTRAINT [PK_DS_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

