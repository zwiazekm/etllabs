CREATE TABLE [aes2].[ZWA_ZamkniecieCelne] (
    [Id]            NUMERIC (19)  NOT NULL,
    [ZnakiZamkniec] NVARCHAR (60) NULL,
    [IdDokZWA]      NUMERIC (19)  NULL,
    CONSTRAINT [ZWA_ZamkniecieCelne$PK_ZWA_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

