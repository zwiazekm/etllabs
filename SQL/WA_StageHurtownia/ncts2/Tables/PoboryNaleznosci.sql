CREATE TABLE [ncts2].[PoboryNaleznosci] (
    [Id]                                  BIGINT        NOT NULL,
    [UC]                                  NVARCHAR (8)  NULL,
    [IdOperacjiTranzytowej]               BIGINT        NULL,
    [MRN]                                 NVARCHAR (18) NULL,
    [RolaUrzedu]                          NVARCHAR (1)  NULL,
    [Status]                              NVARCHAR (8)  NULL,
    [StatusData]                          DATETIME      NULL,
    [UCPoboru]                            NVARCHAR (8)  NULL,
    [UCPrzeprowadzajacyPobor]             NVARCHAR (8)  NULL,
    [IdOperacjiPoszukiwaniaPoboru]        BIGINT        NULL,
    [DataUtworzenia]                      DATETIME      NULL,
    [DataModyfikacji]                     DATETIME      NULL,
    [TypDeklaracji]                       NVARCHAR (5)  NULL,
    [UCWyjscia]                           NVARCHAR (8)  NULL,
    [ProceduraUproszczonaUCPrzeznaczenia] BIT           NULL,
    [PrzedstawiajacyTIN]                  NVARCHAR (17) NULL,
    [PrzedstawiajacyNazwa]                NVARCHAR (35) NULL,
    CONSTRAINT [PoboryNaleznosci_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

