CREATE TABLE [akc].[POG_ZalacznikC] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika] CHAR (2)        NOT NULL,
    [NumerZalacznika]      INT             NOT NULL,
    [PodatekNalezny]       DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikC] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC)
);

