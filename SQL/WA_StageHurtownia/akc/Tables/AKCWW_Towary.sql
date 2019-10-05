CREATE TABLE [akc].[AKCWW_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [KodCN]                VARCHAR (15)    NULL,
    [KodCNPid]             INT             NULL,
    [NazwaGrupyWyrobow]    VARCHAR (255)   NULL,
    [PodstawObliczPodatku] DECIMAL (19, 6) NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKCWW_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

