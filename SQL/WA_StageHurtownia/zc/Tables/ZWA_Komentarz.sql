CREATE TABLE [zc].[ZWA_Komentarz] (
    [Id]        DECIMAL (19)   NOT NULL,
    [Komentarz] NVARCHAR (140) NULL,
    [IdDokZWA]  DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWA_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

