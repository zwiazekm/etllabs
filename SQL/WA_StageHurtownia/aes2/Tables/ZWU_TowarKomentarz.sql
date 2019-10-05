CREATE TABLE [aes2].[ZWU_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (420) NULL,
    [IdTowarZWU] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ZWU_TowarKomentarz$PK_ZWU_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

