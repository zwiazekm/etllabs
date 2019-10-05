CREATE TABLE [zc].[ZWU_Komentarz] (
    [Id]        DECIMAL (19)   NOT NULL,
    [Komentarz] NVARCHAR (140) NULL,
    [IdDokZWU]  DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

