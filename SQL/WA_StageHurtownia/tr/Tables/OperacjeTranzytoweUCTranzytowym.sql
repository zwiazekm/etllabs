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
    CONSTRAINT [PK_OperacjeTranzytoweUCTranzytowy] PRIMARY KEY CLUSTERED ([SID] ASC)
);

