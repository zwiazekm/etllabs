CREATE TABLE [akc].[POG_ZalacznikD] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika] CHAR (2)        NOT NULL,
    [NumerZalacznika]      INT             NOT NULL,
    [PodatekNalezny]       DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikD] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC)
);

