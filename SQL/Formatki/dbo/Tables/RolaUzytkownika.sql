CREATE TABLE [dbo].[RolaUzytkownika] (
    [RolaUzytkownikaId] INT          IDENTITY (1, 1) NOT NULL,
    [NazwaRoli]         VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_GrupaUzytkownikow] PRIMARY KEY CLUSTERED ([RolaUzytkownikaId] ASC)
);

