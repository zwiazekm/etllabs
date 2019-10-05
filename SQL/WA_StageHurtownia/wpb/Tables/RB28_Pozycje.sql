CREATE TABLE [wpb].[RB28_Pozycje] (
    [IdDok]              VARCHAR (30)    NOT NULL,
    [NumerPozycji]       SMALLINT        NOT NULL,
    [Dzial]              VARCHAR (10)    NULL,
    [Rozdzial]           VARCHAR (10)    NULL,
    [Paragraf]           VARCHAR (10)    NULL,
    [PlanPoZmianach]     DECIMAL (19, 2) NULL,
    [Zaangazowanie]      DECIMAL (19, 2) NULL,
    [WykonanieWydatkow]  DECIMAL (19, 2) NULL,
    [OgolemZobowiazania] DECIMAL (19, 2) NULL,
    [ZobowLatUbieglych]  DECIMAL (19, 2) NULL,
    [ZobowBiezacegoRoku] DECIMAL (19, 2) NULL,
    [WydatkiNiewygasle]  DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_RB28_Pozycje] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

