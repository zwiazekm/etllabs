CREATE TABLE [wpb].[RB70_Pozycje] (
    [IdDok]                                 VARCHAR (30)    NOT NULL,
    [NumerPozycji]                          SMALLINT        NOT NULL,
    [Dzial]                                 VARCHAR (10)    NULL,
    [Rozdzial]                              VARCHAR (10)    NULL,
    [StatusZatrudnienia]                    VARCHAR (10)    NULL,
    [PlanPoZmianach]                        DECIMAL (19, 2) NULL,
    [PrzecietneWykonanieWokresieSprawozdaw] DECIMAL (19, 2) NULL,
    [StanNaKoniecOkresuSprawodaw]           DECIMAL (19, 2) NULL,
    [PlanOsoboweUposazenia]                 DECIMAL (19, 2) NULL,
    [PlanDodatkoweWynagrodzenieRoczne]      DECIMAL (19, 2) NULL,
    [WykonanieOsoboweUposazenia]            DECIMAL (19, 2) NULL,
    [DodatkoweWynagrodzenieRoczne]          DECIMAL (19, 2) NULL,
    [WynagrodzeniePozaLimitem]              DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_RB70_Pozycje] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

