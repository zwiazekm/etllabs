CREATE TABLE [dbo].[UzytkownikJednostka] (
    [UzytkownikId]   INT NOT NULL,
    [JednostkaOrgId] INT NOT NULL,
    CONSTRAINT [PK_UzytkownikJednostka] PRIMARY KEY CLUSTERED ([UzytkownikId] ASC, [JednostkaOrgId] ASC),
    CONSTRAINT [FK_UzytkownikJednostka_StrukturaOrganizacyjna] FOREIGN KEY ([JednostkaOrgId]) REFERENCES [dbo].[StrukturaOrganizacyjna] ([JednostkaId]),
    CONSTRAINT [FK_UzytkownikJednostka_Uzytkownik] FOREIGN KEY ([UzytkownikId]) REFERENCES [dbo].[Uzytkownik] ([UzytkownikId])
);

