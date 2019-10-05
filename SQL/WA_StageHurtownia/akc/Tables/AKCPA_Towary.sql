CREATE TABLE [akc].[AKCPA_Towary] (
    [IdDok]                        VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]         CHAR (2)        NOT NULL,
    [NumerZalacznikaSys]           INT             NOT NULL,
    [NumerPozycji]                 INT             NOT NULL,
    [NazwaGrupyWyrobow]            VARCHAR (255)   NULL,
    [KodCN]                        VARCHAR (15)    NULL,
    [KodCNPid]                     INT             NULL,
    [PodstawaObliczeniaPrzedplaty] DECIMAL (20, 3) NULL,
    [WartoscWgMaksCenyDetal]       DECIMAL (20, 2) NULL,
    [StawkaPodatku]                DECIMAL (20, 2) NULL,
    [StawkaPodatkuProcent]         DECIMAL (20, 2) NULL,
    [KwotaPrzedplaty]              DECIMAL (20, 3) NULL,
    CONSTRAINT [PK_AKCPA_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC, [OznaczenieZalacznika] ASC, [NumerZalacznikaSys] ASC)
);

