CREATE TABLE [dbo].[OkresSprawozdawczy] (
    [ID]          INT         IDENTITY (1, 1) NOT NULL,
    [FormatkaKod] VARCHAR (5) NOT NULL,
    [Aktywny]     BIT         NOT NULL,
    [Rok]         SMALLINT    NOT NULL,
    [Kwartal]     TINYINT     NULL,
    [Miesiac]     TINYINT     NULL,
    CONSTRAINT [PK_OkresSprawozdawczy] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OkresSprawozdawczy_Formatka] FOREIGN KEY ([FormatkaKod]) REFERENCES [dbo].[Formatka] ([FormatkaKod])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_OkresSprawozdawczy_Formatka_Okres]
    ON [dbo].[OkresSprawozdawczy]([FormatkaKod] ASC, [Rok] ASC, [Miesiac] ASC, [Kwartal] ASC);

