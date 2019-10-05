CREATE TABLE [fk].[ZestawienieWZPW] (
    [IdDok]                        VARCHAR (30)    NOT NULL,
    [NumerPozycji]                 SMALLINT        NOT NULL,
    [Dzial]                        VARCHAR (10)    NULL,
    [Rozdzial]                     VARCHAR (10)    NULL,
    [Paragraf]                     VARCHAR (10)    NULL,
    [KwotaWZPWPlan]                DECIMAL (19, 2) NULL,
    [KwotaWZPWWykonana]            DECIMAL (19, 2) NULL,
    [KwotaWZPWSaldo]               DECIMAL (19, 2) NULL,
    [KwotaWZPWProcentoweWykonanie] DECIMAL (19, 2) NULL,
    [WZPWOpis]                     VARCHAR (255)   NULL,
    CONSTRAINT [PK_ZestawienieWZPW] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

