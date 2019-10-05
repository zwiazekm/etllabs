CREATE TABLE [tr].[InformacjeoKontenerachTowarow] (
    [SID]                                    INT          NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT          NULL,
    [NrKontenera]                            VARCHAR (17) NOT NULL,
    CONSTRAINT [PK_InformacjeoKontenerachTowarow] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_InformacjeoKontenerachTowarow_SIDPozycjiTowarowejOperacjiTranzytowej_PozycjaTowarowaOperacjiTranzytowej_SID] FOREIGN KEY ([SIDPozycjiTowarowejOperacjiTranzytowej]) REFERENCES [tr].[PozycjaTowarowaOperacjiTranzytowej] ([SID])
);

