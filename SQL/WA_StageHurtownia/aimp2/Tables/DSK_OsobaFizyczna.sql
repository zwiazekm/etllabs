CREATE TABLE [aimp2].[DSK_OsobaFizyczna] (
    [IdOsobyFizycznej]            NUMERIC (19)  NOT NULL,
    [IdAdresu]                    NUMERIC (19)  NULL,
    [Imie]                        NVARCHAR (30) NULL,
    [Nazwisko]                    NVARCHAR (40) NULL,
    [NumerIdentyfikacyjny]        NVARCHAR (30) NULL,
    [PESEL]                       NVARCHAR (11) NULL,
    [Placowka]                    NCHAR (2)     NULL,
    [RodzajPrzedstawicielstwa]    NCHAR (3)     NULL,
    [RodzajPrzedstawicielstwaPid] INT           NULL,
    CONSTRAINT [DSK_OsobaFizyczna_PK] PRIMARY KEY CLUSTERED ([IdOsobyFizycznej] ASC)
);

