CREATE TABLE [tr].[InformacjeoDokumentachTowarow] (
    [SID]                                    INT            NOT NULL,
    [IdTypuDokumentu]                        VARCHAR (6)    NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT            NULL,
    [DokumentReferencyjny]                   NVARCHAR (105) NULL,
    [DokumentPoprzedniZalaczony]             CHAR (1)       NOT NULL,
    CONSTRAINT [PK_informacjeoDokumentachTowarow] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_InformacjeoDokumentachTowarow_IdTypuDokumentu_TypyDokumentow_ID] FOREIGN KEY ([IdTypuDokumentu]) REFERENCES [tr].[TypyDokumentow] ([Id]),
    CONSTRAINT [FK_informacjeoDokumentachTowarow_SIDPozycjiTowarowejOperacjiTranzytowej_PozycjaTowarowaOperacjiTranzytowej_SID] FOREIGN KEY ([SIDPozycjiTowarowejOperacjiTranzytowej]) REFERENCES [tr].[PozycjaTowarowaOperacjiTranzytowej] ([SID])
);

