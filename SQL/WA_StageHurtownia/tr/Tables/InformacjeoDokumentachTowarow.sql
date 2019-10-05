CREATE TABLE [tr].[InformacjeoDokumentachTowarow] (
    [SID]                                    INT            NOT NULL,
    [IdTypuDokumentu]                        VARCHAR (6)    NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT            NULL,
    [DokumentReferencyjny]                   NVARCHAR (105) NULL,
    [DokumentPoprzedniZalaczony]             CHAR (1)       NOT NULL,
    CONSTRAINT [PK_informacjeoDokumentachTowarow] PRIMARY KEY CLUSTERED ([SID] ASC)
);

