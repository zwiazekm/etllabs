CREATE TABLE [tr].[WersjaOperacjiTranzytowej] (
    [SIDOperacjiTranzytowej] INT         NOT NULL,
    [NumerWersji]            DECIMAL (3) NOT NULL,
    [StatusWersji]           CHAR (1)    NOT NULL,
    [TypWersji]              CHAR (1)    NOT NULL,
    CONSTRAINT [PK_WersjaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SIDOperacjiTranzytowej] ASC, [NumerWersji] ASC) ON [FG_TR],
    CONSTRAINT [FK_WersjaOperacjiTranzytowej_SIDOperacjiTranzytowej_OperacjeTranzytowe_SID] FOREIGN KEY ([SIDOperacjiTranzytowej]) REFERENCES [tr].[OperacjeTranzytowe] ([SID])
);

