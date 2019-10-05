CREATE TABLE [zef2].[TypPowiazania] (
    [IDTypuPowiazania]          INT            NOT NULL,
    [NazwaTypuPowiazania]       NVARCHAR (50)  NULL,
    [NazwaTypuPowiazaniaTekst2] NVARCHAR (100) NULL,
    [CzyUzytkownikModyfikacja]  BIT            NULL,
    [operacja]                  NVARCHAR (1)   NULL,
    CONSTRAINT [PK_TypPowiazania] PRIMARY KEY CLUSTERED ([IDTypuPowiazania] ASC)
);

