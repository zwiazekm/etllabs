CREATE TABLE [tr].[InformacjeOPlombach] (
    [SID]                            INT          NOT NULL,
    [MRNZdarzeniaWTrakcieTransportu] VARCHAR (21) NULL,
    [NrSekwencji]                    SMALLINT     NULL,
    [NumerWersji]                    DECIMAL (3)  NULL,
    [SIDOperacjiTranzytowej]         INT          NULL,
    [KodJezykaIdentyfikacjiPlomb]    CHAR (2)     NULL,
    [NumerIdentyfikacyjnyPlomb]      VARCHAR (60) NOT NULL,
    CONSTRAINT [PK_InformacjeOPlombach] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_InfOPlombach_MRNZdarzeniaWTrakcieTransportuSekwencjaZdarzeniaWTrakcieTransportu_ZdarzeniaWTrakcieTransportu_MRNSekwencja] FOREIGN KEY ([MRNZdarzeniaWTrakcieTransportu], [NrSekwencji]) REFERENCES [tr].[ZdarzeniaWTrakcieTransportu] ([MRN], [Sekwencja]),
    CONSTRAINT [FK_InfOPlombach_SIDNumerWersji_WersjaOperacjiTranzytowej_SIDOperacjiTranzytowejNumerWersjiOperacjiTranzytowej] FOREIGN KEY ([SIDOperacjiTranzytowej], [NumerWersji]) REFERENCES [tr].[WersjaOperacjiTranzytowej] ([SIDOperacjiTranzytowej], [NumerWersji])
);

