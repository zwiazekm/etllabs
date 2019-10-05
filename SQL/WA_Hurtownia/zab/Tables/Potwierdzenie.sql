CREATE TABLE [zab].[Potwierdzenie] (
    [IdPotwierdzenia] INT             NOT NULL,
    [Numer]           VARCHAR (40)    NOT NULL,
    [Kwota]           DECIMAL (19, 2) NOT NULL,
    CONSTRAINT [PK_Potwierdzenie] PRIMARY KEY CLUSTERED ([IdPotwierdzenia] ASC) ON [FG_ZAB]
);

