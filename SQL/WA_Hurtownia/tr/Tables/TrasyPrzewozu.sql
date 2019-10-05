CREATE TABLE [tr].[TrasyPrzewozu] (
    [SID]                    INT         NOT NULL,
    [SIDOperacjiTranzytowej] INT         NOT NULL,
    [NumerWersji]            DECIMAL (8) NOT NULL,
    [IDKraju]                CHAR (2)    NOT NULL,
    CONSTRAINT [PK_TrasyPrzewozu] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_TrasyPrzewozu_SIDOperacjiTranzytowej_OperacjeTranzytowe_SID] FOREIGN KEY ([SIDOperacjiTranzytowej]) REFERENCES [tr].[OperacjeTranzytowe] ([SID])
);

