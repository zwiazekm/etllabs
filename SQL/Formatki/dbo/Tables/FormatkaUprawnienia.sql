CREATE TABLE [dbo].[FormatkaUprawnienia] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [FormatkaKod]       VARCHAR (5)  NULL,
    [SekcjaId]          INT          NULL,
    [RolaUzytkownikaId] INT          NOT NULL,
    [Uprawnienia]       VARCHAR (10) NULL,
    CONSTRAINT [PK_FormatkaUprawnienia] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_FormatkaUprawnienia_FormatkaKod_OR_SekcjaId] CHECK ([FormatkaKod] IS NOT NULL OR [SekcjaId] IS NOT NULL),
    CONSTRAINT [FK_FormatkaUprawnienia_Formatka] FOREIGN KEY ([FormatkaKod]) REFERENCES [dbo].[Formatka] ([FormatkaKod]),
    CONSTRAINT [FK_FormatkaUprawnienia_FormatkaSekcje] FOREIGN KEY ([SekcjaId]) REFERENCES [dbo].[FormatkaSekcje] ([SekcjaId]),
    CONSTRAINT [FK_FormatkaUprawnienia_RolaUzytkownika] FOREIGN KEY ([RolaUzytkownikaId]) REFERENCES [dbo].[RolaUzytkownika] ([RolaUzytkownikaId]),
    CONSTRAINT [Duplikat_Uprawnienia_Formatki] UNIQUE NONCLUSTERED ([FormatkaKod] ASC, [SekcjaId] ASC, [RolaUzytkownikaId] ASC, [Uprawnienia] ASC)
);

