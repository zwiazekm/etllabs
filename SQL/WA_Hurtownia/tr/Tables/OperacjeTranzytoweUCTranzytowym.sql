CREATE TABLE [tr].[OperacjeTranzytoweUCTranzytowym] (
    [SID]                                     INT          NOT NULL,
    [StatusOperacjiTranzytowejWUCTranzytowym] CHAR (3)     NULL,
    [IDUrzeduTranzytowego]                    VARCHAR (8)  NOT NULL,
    [NumerWersji]                             DECIMAL (3)  NULL,
    [CzyPrzybycie]                            BIT          NULL,
    [DataPrzybyciaDoUrzedu]                   DATETIME     NULL,
    [DataZmianyStatusu]                       DATETIME     NULL,
    [GwarancjaNiewazna]                       CHAR (1)     NULL,
    [MRN]                                     VARCHAR (21) NULL,
    [SIDOperacjiTranzytowej]                  INT          NULL,
    CONSTRAINT [PK_OperacjeTranzytoweUCTranzytowy] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_OperacjeTranzytoweUCTranzytowy_IDUrzeduWyjscia_Urzedy_IDUrzedu] FOREIGN KEY ([IDUrzeduTranzytowego]) REFERENCES [tr].[Urzedy] ([IDUrzedu]),
    CONSTRAINT [FK_OperacjeTranzytoweUCTranzytowy_NumerWersjiWUCTranzytowymSIDOperacjiTranzytowej_WersjaOperacjiTranzytowej_SIDOperTranzNrWer] FOREIGN KEY ([SIDOperacjiTranzytowej], [NumerWersji]) REFERENCES [tr].[WersjaOperacjiTranzytowej] ([SIDOperacjiTranzytowej], [NumerWersji]),
    CONSTRAINT [FK_OperacjeTranzytoweUCTranzytowy_StatusOperacjiTranzytowejWUCTranzytowym_TypyStatusowOperacjiTranzytowej_IDTypuStatOperTranz] FOREIGN KEY ([StatusOperacjiTranzytowejWUCTranzytowym]) REFERENCES [tr].[TypyStatusowOperacjiTranzytowej] ([Id])
);

