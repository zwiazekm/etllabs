CREATE TABLE [aes2].[DWA_ZamkniecieCelne] (
    [Id]           NUMERIC (19)   NOT NULL,
    [IdDokDWA]     NUMERIC (19)   NULL,
    [NrZamkniecia] NVARCHAR (255) NULL,
    CONSTRAINT [DWA_ZamkniecieCelne$PK_DWA_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

