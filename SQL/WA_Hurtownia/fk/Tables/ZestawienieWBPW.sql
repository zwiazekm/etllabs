CREATE TABLE [fk].[ZestawienieWBPW] (
    [IdDok]              VARCHAR (30)    NOT NULL,
    [NumerPozycji]       SMALLINT        NOT NULL,
    [Dzial]              VARCHAR (10)    NULL,
    [Rozdzial]           VARCHAR (10)    NULL,
    [Paragraf]           VARCHAR (10)    NULL,
    [Tytul]              VARCHAR (10)    NULL,
    [KwotaWBPWWykonania] DECIMAL (19, 2) NULL,
    [WBPWOpisParagrafu]  VARCHAR (255)   NULL,
    [WBPWOpisTytulu]     VARCHAR (255)   NULL,
    CONSTRAINT [PK_ZestawienieWBPW] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_FK],
    CONSTRAINT [FK_ZestawienieWBPW_IdDok_SprawozdanieMeldunkowe_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [fk].[SprawozdanieMeldunkowe] ([IdDok])
);

