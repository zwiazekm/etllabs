CREATE TABLE [fk].[Uszczuplenia] (
    [IdDok]                    VARCHAR (30)    NOT NULL,
    [NumerPozycjiUszczuplenia] SMALLINT        NOT NULL,
    [RodzajNaleznosci]         CHAR (6)        NULL,
    [KwotaUszczuplenia]        DECIMAL (20, 2) NULL,
    CONSTRAINT [PK_Uszczuplenia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycjiUszczuplenia] ASC)
);

