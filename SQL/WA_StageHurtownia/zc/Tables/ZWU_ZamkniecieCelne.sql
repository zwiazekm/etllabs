CREATE TABLE [zc].[ZWU_ZamkniecieCelne] (
    [Id]            DECIMAL (19)   NOT NULL,
    [ZnakiZamkniec] NVARCHAR (255) NULL,
    [IdDokZWU]      DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

