CREATE TABLE [fk].[Slowniki] (
    [IdRodzajuSlownika] CHAR (6)     NOT NULL,
    [IdSlownika]        CHAR (6)     NOT NULL,
    [NazwaKwalifikacji] VARCHAR (80) NULL,
    CONSTRAINT [PK_Slowniki] PRIMARY KEY CLUSTERED ([IdRodzajuSlownika] ASC, [IdSlownika] ASC)
);

