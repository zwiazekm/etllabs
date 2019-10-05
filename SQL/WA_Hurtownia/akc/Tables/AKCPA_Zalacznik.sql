CREATE TABLE [akc].[AKCPA_Zalacznik] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (2)        NOT NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [KwotaPrzedplatyAkcyzy]     DECIMAL (19, 3) NULL,
    [NadwyzkaPrzedplatyAkcyzy]  DECIMAL (19, 3) NULL,
    [PrzedplataAkcyzyDoZaplaty] DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKCPA_Zalacznik] PRIMARY KEY CLUSTERED ([IdDok] ASC, [OznaczenieZalacznika] ASC, [NumerZalacznikaSys] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKCPA_Zalacznik_IdDok_AKCPA_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKCPA_Deklaracja] ([IdDok])
);

