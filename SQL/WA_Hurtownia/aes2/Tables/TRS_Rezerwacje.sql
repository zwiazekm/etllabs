CREATE TABLE [aes2].[TRS_Rezerwacje] (
    [Id]                      NUMERIC (19)    NOT NULL,
    [IdPozycjiTRS]            NUMERIC (19)    NULL,
    [IdDeklaracjiTranzytowej] NUMERIC (19)    NULL,
    [IdDeklaracjiWywozowej]   NUMERIC (19)    NULL,
    [IdPozycjiTranzytowej]    SMALLINT        NULL,
    [KodTowarowy]             NVARCHAR (6)    NULL,
    [KodTowarowyPid]          INT             NULL,
    [MRN]                     NVARCHAR (35)   NULL,
    [NrPozycjiWywozowej]      SMALLINT        NULL,
    [MasaZarezerwowana]       NUMERIC (11, 3) NULL,
    [Wersja]                  INT             NOT NULL,
    [KomentarzNCTS]           NVARCHAR (380)  NULL,
    CONSTRAINT [TRS_Rezerwacje$PK_TRS_Rezerwacje] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__TRS_Rezerwacje_IdPozycjiTRS__TRS_Pozycje_id] FOREIGN KEY ([IdPozycjiTRS]) REFERENCES [aes2].[TRS_Pozycje] ([Id])
);

