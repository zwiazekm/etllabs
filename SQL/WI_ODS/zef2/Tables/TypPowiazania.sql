CREATE TABLE [zef2].[TypPowiazania] (
    [IDTypuPowiazania]          INT            NOT NULL,
    [NazwaTypuPowiazania]       NVARCHAR (50)  NOT NULL,
    [NazwaTypuPowiazaniaTekst2] NVARCHAR (100) NULL,
    [CzyUzytkownikModyfikacja]  BIT            NULL,
    CONSTRAINT [PK_TypPowiazania] PRIMARY KEY CLUSTERED ([IDTypuPowiazania] ASC) ON [FG_ZEF2]
);

