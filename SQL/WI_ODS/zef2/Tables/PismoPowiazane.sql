CREATE TABLE [zef2].[PismoPowiazane] (
    [IDPismoPowiazane]   INT            NOT NULL,
    [IDPisma]            INT            NOT NULL,
    [IDPismaPowiazanego] INT            NOT NULL,
    [IDTypuPowiazania]   INT            NULL,
    [DataWiazania]       DATETIME       NULL,
    [Notatka]            NVARCHAR (500) NULL,
    CONSTRAINT [PK_PismoPowiazane] PRIMARY KEY CLUSTERED ([IDPismoPowiazane] ASC) WITH (FILLFACTOR = 70) ON [FG_ZEF2]
);


GO
CREATE NONCLUSTERED INDEX [IDPisma]
    ON [zef2].[PismoPowiazane]([IDPisma] ASC)
    ON [FG_ZEF2];


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160518-143807]
    ON [zef2].[PismoPowiazane]([IDPismaPowiazanego] ASC)
    ON [FG_ZEF2];


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160518-143843]
    ON [zef2].[PismoPowiazane]([IDTypuPowiazania] ASC)
    ON [FG_ZEF2];

