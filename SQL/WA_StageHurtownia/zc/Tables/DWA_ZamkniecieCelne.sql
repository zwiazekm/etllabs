CREATE TABLE [zc].[DWA_ZamkniecieCelne] (
    [Id]           DECIMAL (19)  NOT NULL,
    [NrZamkniecia] VARCHAR (255) NULL,
    [IdDokDWA]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

