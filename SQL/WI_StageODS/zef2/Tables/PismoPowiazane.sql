CREATE TABLE [zef2].[PismoPowiazane] (
    [IDPismoPowiazane]   INT            NOT NULL,
    [IDPisma]            INT            NULL,
    [IDPismaPowiazanego] INT            NULL,
    [IDTypuPowiazania]   INT            NULL,
    [DataWiazania]       DATETIME       NULL,
    [Notatka]            NVARCHAR (500) NULL,
    [operacja]           NVARCHAR (1)   NULL,
    CONSTRAINT [PK_PismoPowiazane] PRIMARY KEY CLUSTERED ([IDPismoPowiazane] ASC) WITH (FILLFACTOR = 70)
);

