CREATE TABLE [tr].[SzczegolyKontroli] (
    [MRN]                       VARCHAR (21)    NOT NULL,
    [SIDOperacjiTranzytowej]    INT             NULL,
    [KodLokalizacjiKontroli]    CHAR (3)        NOT NULL,
    [IDKrajuWyjscia]            CHAR (2)        NULL,
    [LiczbaPaczek]              DECIMAL (7)     NULL,
    [LiczbaPozycjiTowarowych]   DECIMAL (5)     NULL,
    [MasaBrutto]                DECIMAL (14, 3) NULL,
    [NrSrTranspWMiejscuWyjscia] VARCHAR (27)    NULL,
    CONSTRAINT [PK_SzczegolyKontroli] PRIMARY KEY CLUSTERED ([MRN] ASC, [KodLokalizacjiKontroli] ASC) ON [FG_TR],
    CONSTRAINT [FK_SzczegolyKontroli_SIDOperacjiTranzytowej_OperacjeTranzytowe_SID] FOREIGN KEY ([SIDOperacjiTranzytowej]) REFERENCES [tr].[OperacjeTranzytowe] ([SID])
);

