CREATE TABLE [akc].[POG_ZalacznikA] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika] CHAR (2)        NOT NULL,
    [NumerZalacznika]      INT             NOT NULL,
    [PodatekNalezny]       DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikA] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC) ON [FG_AKC],
    CONSTRAINT [FK_POG_ZalacznikA_IdDok_POG_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[POG_Deklaracja] ([IdDok])
);

