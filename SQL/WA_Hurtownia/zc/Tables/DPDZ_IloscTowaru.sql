CREATE TABLE [zc].[DPDZ_IloscTowaru] (
    [IdDok]                BIGINT          NOT NULL,
    [IdPozycji]            SMALLINT        NOT NULL,
    [IdPozycjiIloscTowaru] SMALLINT        NOT NULL,
    [Jm]                   CHAR (3)        NULL,
    [JmPid]                INT             NULL,
    [KwalifikatorJm]       CHAR (1)        NULL,
    [KwalifikatorJmPid]    INT             NULL,
    [Ilosc]                DECIMAL (20, 5) NULL,
    CONSTRAINT [PK_DPDZ_IloscTowaru] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiIloscTowaru] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_JmPid] FOREIGN KEY ([JmPid]) REFERENCES [pdr].[s068] ([s068_id]),
    CONSTRAINT [FK_DPDZ_Dokument_KwalifikatorJmPid] FOREIGN KEY ([KwalifikatorJmPid]) REFERENCES [pdr].[s069] ([s069_id]),
    CONSTRAINT [FK_DPDZ_IloscTowaru_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

