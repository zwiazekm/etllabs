CREATE TABLE [tr].[InformacjeDodatkoweOTowarach] (
    [SIDInformacjiDodatkowychOTowarach]      INT         NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT         NULL,
    [KodInformacjiDodatkowej]                VARCHAR (5) NULL,
    CONSTRAINT [PK_SIDInformacjiDodatkowychOTowarach] PRIMARY KEY CLUSTERED ([SIDInformacjiDodatkowychOTowarach] ASC) ON [FG_TR],
    CONSTRAINT [FK_InformacjeDodatkoweOTowarach_KodInformacjiDodatkowej] FOREIGN KEY ([KodInformacjiDodatkowej]) REFERENCES [tr].[KodyInformacjiDodatkowych] ([Id]),
    CONSTRAINT [FK_InformacjeDodatkoweOTowarach_SIDPozycjiTowarowejOperacjiTranzytowej] FOREIGN KEY ([SIDPozycjiTowarowejOperacjiTranzytowej]) REFERENCES [tr].[PozycjaTowarowaOperacjiTranzytowej] ([SID])
);

