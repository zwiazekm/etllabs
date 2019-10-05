CREATE TABLE [zab].[PokwitowaniePotwierdzenie] (
    [IdPokwitowaniaPotwierdzenia] INT             NOT NULL,
    [Numer]                       VARCHAR (150)   NULL,
    [Kwota]                       DECIMAL (19, 2) NOT NULL,
    [IdGwarancji]                 INT             NULL,
    CONSTRAINT [PK_PokwitowaniePotwierdzenie] PRIMARY KEY CLUSTERED ([IdPokwitowaniaPotwierdzenia] ASC)
);

