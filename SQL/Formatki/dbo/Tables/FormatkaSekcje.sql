CREATE TABLE [dbo].[FormatkaSekcje] (
    [SekcjaId]    INT           IDENTITY (1, 1) NOT NULL,
    [FormatkaKod] VARCHAR (5)   NOT NULL,
    [SekcjaKod]   VARCHAR (5)   NULL,
    [Nazwa]       VARCHAR (200) NOT NULL,
    [LP]          TINYINT       NOT NULL,
    CONSTRAINT [PK_FormatkaSekcje] PRIMARY KEY CLUSTERED ([SekcjaId] ASC),
    CONSTRAINT [FK_FormatkaSekcje_Formatka] FOREIGN KEY ([FormatkaKod]) REFERENCES [dbo].[Formatka] ([FormatkaKod]),
    CONSTRAINT [UQ_FormatkaSekcje_SekcjaId] UNIQUE NONCLUSTERED ([SekcjaId] ASC),
    CONSTRAINT [UQ_FormatkaSekcje_SekcjaKod_FormatkaKod] UNIQUE NONCLUSTERED ([SekcjaKod] ASC, [FormatkaKod] ASC)
);

