CREATE TABLE [aes2].[ZWP_Komentarz] (
    [Id]        NUMERIC (19)   NOT NULL,
    [Komentarz] NVARCHAR (840) NULL,
    [IdDokZWP]  NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_Komentarz$PK_ZWP_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

