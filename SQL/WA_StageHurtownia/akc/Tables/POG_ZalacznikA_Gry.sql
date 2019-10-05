CREATE TABLE [akc].[POG_ZalacznikA_Gry] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika] CHAR (2)        NOT NULL,
    [NumerZalacznika]      INT             NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [RodzajGry]            VARCHAR (255)   NULL,
    [KodGry]               VARCHAR (15)    NULL,
    [PodstawObliczPodatku] DECIMAL (19, 3) NULL,
    [StawkaPodatkuProcent] DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikA_Gry] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC, [NumerPozycji] ASC)
);

