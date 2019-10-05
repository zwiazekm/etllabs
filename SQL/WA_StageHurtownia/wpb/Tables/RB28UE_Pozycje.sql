CREATE TABLE [wpb].[RB28UE_Pozycje] (
    [IdDok]             VARCHAR (30)    NOT NULL,
    [NumerPozycji]      SMALLINT        NOT NULL,
    [NazwaProgramu]     VARCHAR (255)   NULL,
    [Dzial]             VARCHAR (10)    NULL,
    [Rozdzial]          VARCHAR (10)    NULL,
    [Paragraf]          VARCHAR (10)    NULL,
    [PlanPoZmianach]    DECIMAL (19, 2) NULL,
    [Zaangazowanie]     DECIMAL (19, 2) NULL,
    [WykonanieWydatkow] DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_RB28UE_Pozycje] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

