CREATE TABLE [zc].[SAD_IloscTowaru] (
    [IdDok]                BIGINT          NOT NULL,
    [IdPozycji]            SMALLINT        NOT NULL,
    [IdPozycjiIloscTowaru] SMALLINT        NOT NULL,
    [Jm]                   CHAR (3)        NULL,
    [JmPid]                INT             NULL,
    [Ilosc]                DECIMAL (20, 5) NULL,
    [KwalifikatorJm]       CHAR (1)        NULL,
    [KwalifikatorJmPid]    INT             NULL,
    CONSTRAINT [PK_SAD_IloscTowaru] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiIloscTowaru] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_IloscTowaru_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_IloscTowaru_JmPid] FOREIGN KEY ([JmPid]) REFERENCES [pdr].[s068] ([s068_id]),
    CONSTRAINT [FK_SAD_IloscTowaru_KwalifikatorJmPid] FOREIGN KEY ([KwalifikatorJmPid]) REFERENCES [pdr].[s069] ([s069_id])
);

