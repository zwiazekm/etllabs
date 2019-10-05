CREATE TABLE [zab].[ZlozenieZabezpieczenia] (
    [IdZlozeniaZabezp]               INT             NOT NULL,
    [Zrodlo]                         CHAR (3)        NOT NULL,
    [FormaZlozeniaZabezpieczeniaPid] INT             NOT NULL,
    [IdGwarancji]                    INT             NULL,
    [IdPotwierdzenia]                INT             NULL,
    [IdHipoteki]                     INT             NULL,
    [IdPokwitowaniaPotwierdzenia]    INT             NULL,
    [IdZabezpieczenia]               INT             NULL,
    [KwotaUdzielonaNaZabezp]         DECIMAL (19, 2) NULL,
    [Opis]                           VARCHAR (4000)  NULL,
    CONSTRAINT [PK_ZlozenieZabezpieczenia] PRIMARY KEY CLUSTERED ([IdZlozeniaZabezp] ASC, [Zrodlo] ASC) ON [FG_ZAB],
    CONSTRAINT [FK_ZlozenieZabezpieczenia_FormaZlozeniaZabezpieczenia_FormaZlozeniaZabezpieczenia_Kod] FOREIGN KEY ([FormaZlozeniaZabezpieczeniaPid]) REFERENCES [pdr].[c3500] ([c3500_id]),
    CONSTRAINT [FK_ZlozenieZabezpieczenia_IdGwarancji_Gwarancja_IdGwarancji] FOREIGN KEY ([IdGwarancji]) REFERENCES [zab].[Gwarancja] ([IdGwarancji]),
    CONSTRAINT [FK_ZlozenieZabezpieczenia_IdHipoteki_Hipoteka_IdHipoteki] FOREIGN KEY ([IdHipoteki]) REFERENCES [zab].[Hipoteka] ([IdHipoteki]),
    CONSTRAINT [FK_ZlozenieZabezpieczenia_IdPokwitowaniaPotwierdzenia_PokwitowaniePotwierdzenie_IdPokwitowaniaPotwierdzenia] FOREIGN KEY ([IdPokwitowaniaPotwierdzenia]) REFERENCES [zab].[PokwitowaniePotwierdzenie] ([IdPokwitowaniaPotwierdzenia]),
    CONSTRAINT [FK_ZlozenieZabezpieczenia_IdPotwierdzenia_Potwierdzenie_IdPotwierdzenia] FOREIGN KEY ([IdPotwierdzenia]) REFERENCES [zab].[Potwierdzenie] ([IdPotwierdzenia]),
    CONSTRAINT [FK_ZlozenieZabezpieczenia_IdZabezpieczenia_Zabezpieczenia_IdZabezpieczenia] FOREIGN KEY ([IdZabezpieczenia]) REFERENCES [zab].[Zabezpieczenia] ([IdZabezpieczenia])
);

