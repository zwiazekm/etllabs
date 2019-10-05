CREATE TABLE [zc].[SAD_InformacjaDodatkowa] (
    [IdDok]           BIGINT      NOT NULL,
    [IdPozycji]       SMALLINT    NOT NULL,
    [IdPozycjiInfDod] SMALLINT    NOT NULL,
    [KodInfDod]       VARCHAR (5) NULL,
    [KodInfDodPid]    INT         NULL,
    CONSTRAINT [PK_SAD_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiInfDod] ASC)
);

