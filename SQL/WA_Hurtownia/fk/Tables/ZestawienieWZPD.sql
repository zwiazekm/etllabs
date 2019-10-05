CREATE TABLE [fk].[ZestawienieWZPD] (
    [IdDok]                        VARCHAR (30)    NOT NULL,
    [NumerPozycji]                 SMALLINT        NOT NULL,
    [Dzial]                        VARCHAR (10)    NULL,
    [Rozdzial]                     VARCHAR (10)    NULL,
    [Paragraf]                     VARCHAR (10)    NULL,
    [KwotaWZPDPlan]                DECIMAL (19, 2) NULL,
    [KwotaWZPDWykonana]            DECIMAL (19, 2) NULL,
    [KwotaWZPDSaldo]               DECIMAL (19, 2) NULL,
    [KwotaWZPDProcentoweWykonanie] DECIMAL (19, 2) NULL,
    [WZPDOpis]                     VARCHAR (255)   NULL,
    CONSTRAINT [PK_ZestawienieWZPD] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_FK],
    CONSTRAINT [FK_ZestawienieWZPD_IdDok_SprawozdanieMeldunkowe_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [fk].[SprawozdanieMeldunkowe] ([IdDok])
);

