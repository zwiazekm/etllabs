CREATE TABLE [akc].[AKCU_Towary] (
    [IdDok]                       VARCHAR (30)    NOT NULL,
    [NumerPozycji]                INT             NOT NULL,
    [KodCN]                       VARCHAR (15)    NULL,
    [KodCNPid]                    INT             NULL,
    [OpisTowaru]                  VARCHAR (255)   NULL,
    [PodstawObliczPodatku]        DECIMAL (19, 6) NULL,
    [PodstawObliczPodatkuProcent] DECIMAL (19, 6) NULL,
    [StawkaPodatku]               DECIMAL (19, 2) NULL,
    [KwotaPodatku]                DECIMAL (19, 2) NULL,
    [LiczbaSamochodow]            DECIMAL (19, 2) NULL,
    [DataPowstObowPodatk]         DATE            NULL,
    [TerminPlatnosciPoz]          DATE            NULL,
    [MarkaSamochodu]              VARCHAR (50)    NULL,
    [TypSamochodu]                VARCHAR (30)    NULL,
    [ModelSamochodu]              VARCHAR (30)    NULL,
    [NumerVIN]                    VARCHAR (20)    NULL,
    [NumerSilnika]                VARCHAR (30)    NULL,
    [Pojemnosc]                   VARCHAR (10)    NULL,
    [RokProdukcji]                CHAR (4)        NULL,
    CONSTRAINT [PK_AKCU_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

