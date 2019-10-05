CREATE TABLE [aes2].[DWU_ZamkniecieCelne] (
    [Id]           NUMERIC (19)   NOT NULL,
    [IdDokDWU]     NUMERIC (19)   NULL,
    [NrZamkniecia] NVARCHAR (255) NULL,
    CONSTRAINT [DWU_ZamkniecieCelne$PK_DWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

