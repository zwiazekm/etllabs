CREATE TABLE [fk].[ZestawienieWBPD] (
    [IdDok]              VARCHAR (30)    NOT NULL,
    [NumerPozycji]       SMALLINT        NOT NULL,
    [Dzial]              VARCHAR (10)    NULL,
    [Rozdzial]           VARCHAR (10)    NULL,
    [Paragraf]           VARCHAR (10)    NULL,
    [Tytul]              VARCHAR (10)    NULL,
    [KwotaWBPDWykonania] DECIMAL (19, 2) NULL,
    [WBPDOpisParagrafu]  VARCHAR (255)   NULL,
    [WBPDOpisTytulu]     VARCHAR (255)   NULL,
    CONSTRAINT [PK_ZestawienieWBPD] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_FK],
    CONSTRAINT [FK_ZestawienieWBPD_IdDok_SprawozdanieMeldunkowe_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [fk].[SprawozdanieMeldunkowe] ([IdDok])
);

