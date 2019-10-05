CREATE TABLE [akc].[AKCP_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [NazwaGrupyWyrobow]    VARCHAR (255)   NULL,
    [KodCN]                VARCHAR (15)    NULL,
    [KodCNPid]             INT             NULL,
    [MarkaSamochodu]       VARCHAR (50)    NULL,
    [MarkaSamochoduPid]    INT             NULL,
    [TypSamochodu]         VARCHAR (30)    NULL,
    [ModelSamochodu]       VARCHAR (30)    NULL,
    [NumerVIN]             VARCHAR (20)    NULL,
    [Pojemnosc]            VARCHAR (10)    NULL,
    [RokProdukcji]         CHAR (4)        NULL,
    [DataSprzedazSamoch]   DATE            NULL,
    [PodstawObliczPodatku] DECIMAL (19, 6) NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKCP_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

