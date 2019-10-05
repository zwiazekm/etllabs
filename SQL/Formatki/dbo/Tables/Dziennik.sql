CREATE TABLE [dbo].[Dziennik] (
    [Id]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [Data]          DATETIME        NOT NULL,
    [Status]        CHAR (1)        NOT NULL,
    [Aplikacja]     VARCHAR (25)    NULL,
    [Operacja]      VARCHAR (50)    NULL,
    [Komunikat]     NVARCHAR (1900) NULL,
    [DocId]         VARCHAR (40)    NULL,
    [Uzytkownik]    NVARCHAR (256)  NULL,
    [CzasWykonania] BIGINT          NULL,
    CONSTRAINT [PK_Dziennik] PRIMARY KEY CLUSTERED ([Id] ASC)
);

