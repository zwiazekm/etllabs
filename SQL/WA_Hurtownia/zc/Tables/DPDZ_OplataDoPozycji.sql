CREATE TABLE [zc].[DPDZ_OplataDoPozycji] (
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
    CONSTRAINT [PK_DPDZ_OplataDoPozycji] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiOplata] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_TypPid] FOREIGN KEY ([TypPid]) REFERENCES [pdr].[s014] ([s014_id]),
    CONSTRAINT [FK_DPDZ_MetodaPlatnosciPid] FOREIGN KEY ([MetodaPlatnosciPid]) REFERENCES [pdr].[s006] ([s006_id]),
    CONSTRAINT [FK_DPDZ_OplataDoPozycji_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

