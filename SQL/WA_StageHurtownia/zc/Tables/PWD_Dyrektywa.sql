CREATE TABLE [zc].[PWD_Dyrektywa] (
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
    CONSTRAINT [PK_PWD_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

