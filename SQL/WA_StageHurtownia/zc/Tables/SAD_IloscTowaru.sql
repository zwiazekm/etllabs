CREATE TABLE [zc].[SAD_IloscTowaru] (
    [IdDok]                BIGINT          NOT NULL,
    [IdPozycji]            SMALLINT        NOT NULL,
    [IdPozycjiIloscTowaru] SMALLINT        NOT NULL,
    [Jm]                   CHAR (3)        NULL,
    [JmPid]                INT             NULL,
    [Ilosc]                DECIMAL (20, 5) NULL,
    [KwalifikatorJm]       CHAR (1)        NULL,
    [KwalifikatorJmPid]    INT             NULL,
    CONSTRAINT [PK_SAD_IloscTowaru] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiIloscTowaru] ASC)
);

