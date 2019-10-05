CREATE TABLE [zc].[DPDZ_IloscTowaru] (
    [IdDok]                BIGINT          NOT NULL,
    [IdPozycji]            SMALLINT        NOT NULL,
    [IdPozycjiIloscTowaru] SMALLINT        NOT NULL,
    [Jm]                   CHAR (3)        NULL,
    [JmPid]                INT             NULL,
    [KwalifikatorJm]       CHAR (1)        NULL,
    [KwalifikatorJmPid]    INT             NULL,
    [Ilosc]                DECIMAL (20, 5) NULL,
    CONSTRAINT [PK_DPDZ_IloscTowaru] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiIloscTowaru] ASC)
);

