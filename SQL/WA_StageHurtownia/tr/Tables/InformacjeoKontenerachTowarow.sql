CREATE TABLE [tr].[InformacjeoKontenerachTowarow] (
    [SID]                                    INT          NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT          NULL,
    [NrKontenera]                            VARCHAR (17) NOT NULL,
    CONSTRAINT [PK_InformacjeoKontenerachTowarow] PRIMARY KEY CLUSTERED ([SID] ASC)
);

