CREATE TABLE [aes2].[ZWU_Komentarz] (
    [Id]        NUMERIC (19)   NOT NULL,
    [IdDokZWU]  NUMERIC (19)   NULL,
    [Komentarz] NVARCHAR (420) NULL,
    CONSTRAINT [ZWU_Komentarz$PK_ZWU_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

