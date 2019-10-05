CREATE TABLE [wpb].[RB28PR_Pozycje] (
    [IdDok]                    VARCHAR (30)    NOT NULL,
    [NumerPozycji]             SMALLINT        NOT NULL,
    [KodPozycji]               VARCHAR (10)    NULL,
    [NazwaProgramu]            VARCHAR (255)   NULL,
    [Czesc]                    VARCHAR (10)    NULL,
    [Dzial]                    VARCHAR (10)    NULL,
    [Rozdzial]                 VARCHAR (10)    NULL,
    [Paragraf]                 VARCHAR (10)    NULL,
    [PlanPoZmianachWkladUE]    DECIMAL (19, 2) NULL,
    [PlanPoZmianachWkladBP]    DECIMAL (19, 2) NULL,
    [ZaangazowanieWkladUE]     DECIMAL (19, 2) NULL,
    [ZaangazowanieWkladBP]     DECIMAL (19, 2) NULL,
    [WykonanieWydatkowWkladBP] DECIMAL (19, 2) NULL,
    [WykonanieWydatkowWkladUE] DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_RB28PR_Pozycje] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_WPB],
    CONSTRAINT [FK_RB28PR_Pozycje_IdDok_RB28PR_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [wpb].[RB28PR_Dokument] ([IdDok])
);

