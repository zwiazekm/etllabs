CREATE TABLE [zc].[SAD_Oplata] (
    [IdDok]              BIGINT          NOT NULL,
    [IdPozycji]          SMALLINT        NOT NULL,
    [IdPozycjiOplata]    SMALLINT        NOT NULL,
    [Typ]                CHAR (3)        NULL,
    [TypPid]             INT             NULL,
    [Podstawa]           DECIMAL (17, 2) NULL,
    [Stawka]             DECIMAL (7, 2)  NULL,
    [Kwota]              DECIMAL (17, 2) NULL,
    [MetodaPlatnosci]    CHAR (1)        NULL,
    [MetodaPlatnosciPid] INT             NULL,
    CONSTRAINT [PK_SAD_Oplata] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiOplata] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Oplata_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_Oplata_MetodaPlatnosciPid] FOREIGN KEY ([MetodaPlatnosciPid]) REFERENCES [pdr].[s006] ([s006_id]),
    CONSTRAINT [FK_SAD_Oplata_TypPid] FOREIGN KEY ([TypPid]) REFERENCES [pdr].[s014] ([s014_id])
);

