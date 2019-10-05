CREATE TABLE [dbo].[Uzytkownik] (
    [UzytkownikId] INT            IDENTITY (1, 1) NOT NULL,
    [Login]        NVARCHAR (256) NOT NULL,
    [Imie]         NVARCHAR (30)  NULL,
    [Nazwisko]     NVARCHAR (60)  NULL,
    PRIMARY KEY CLUSTERED ([UzytkownikId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Uzytkownik_Login]
    ON [dbo].[Uzytkownik]([Login] ASC);

