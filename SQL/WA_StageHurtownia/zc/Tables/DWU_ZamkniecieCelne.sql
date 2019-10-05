CREATE TABLE [zc].[DWU_ZamkniecieCelne] (
    [Id]           DECIMAL (19)  NOT NULL,
    [NrZamkniecia] VARCHAR (255) NULL,
    [IdDokDWU]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

