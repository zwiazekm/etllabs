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
    CONSTRAINT [PoboryNaleznosci_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [PoboryNaleznosci_IdOperacjiPoszukiwaniaPoboru_PoszukiwaniaPobory_fk] FOREIGN KEY ([IdOperacjiPoszukiwaniaPoboru]) REFERENCES [ncts2].[PoszukiwaniaPobory] ([Id]),
    CONSTRAINT [PoboryNaleznosci_IdOperacjiTranzytowej_OperacjeTranzytowe_fk] FOREIGN KEY ([IdOperacjiTranzytowej]) REFERENCES [ncts2].[OperacjeTranzytowe] ([Id])
);

