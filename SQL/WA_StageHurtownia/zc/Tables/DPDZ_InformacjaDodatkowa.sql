CREATE TABLE [zc].[DPDZ_InformacjaDodatkowa] (
    [IdDok]           BIGINT      NOT NULL,
    [IdPozycji]       SMALLINT    NOT NULL,
    [IdPozycjiInfDod] SMALLINT    NOT NULL,
    [KodInfDod]       VARCHAR (5) NULL,
    [KodInfDodPid]    INT         NULL,
    CONSTRAINT [PK_DPDZ_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiInfDod] ASC)
);

