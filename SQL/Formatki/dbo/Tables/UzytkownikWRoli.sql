CREATE TABLE [dbo].[UzytkownikWRoli] (
    [RolaUzytkownikaId] INT NOT NULL,
    [UzytkownikId]      INT NOT NULL,
    CONSTRAINT [PK_UzytkownikWRoli] PRIMARY KEY CLUSTERED ([RolaUzytkownikaId] ASC, [UzytkownikId] ASC),
    CONSTRAINT [FK_UzytkownikWRoli_RolaUzytkownika] FOREIGN KEY ([RolaUzytkownikaId]) REFERENCES [dbo].[RolaUzytkownika] ([RolaUzytkownikaId]),
    CONSTRAINT [FK_UzytkownikWRoli_Uzytkownik] FOREIGN KEY ([UzytkownikId]) REFERENCES [dbo].[Uzytkownik] ([UzytkownikId])
);

