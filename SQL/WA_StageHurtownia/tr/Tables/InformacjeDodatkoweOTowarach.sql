CREATE TABLE [tr].[InformacjeDodatkoweOTowarach] (
    [SIDInformacjiDodatkowychOTowarach]      INT         NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT         NULL,
    [KodInformacjiDodatkowej]                VARCHAR (5) NULL,
    CONSTRAINT [PK_SIDInformacjiDodatkowychOTowarach] PRIMARY KEY CLUSTERED ([SIDInformacjiDodatkowychOTowarach] ASC)
);

