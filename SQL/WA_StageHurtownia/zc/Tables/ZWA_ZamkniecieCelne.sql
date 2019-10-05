CREATE TABLE [zc].[ZWA_ZamkniecieCelne] (
    [Id]            DECIMAL (19)  NOT NULL,
    [ZnakiZamkniec] NVARCHAR (20) NULL,
    [IdDokZWA]      DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_ZamknieciaCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

