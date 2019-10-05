CREATE TABLE [aimp2].[ZCP_DecyzjaAdministracyjna] (
    [IdDecyzji]                  NUMERIC (19)    NOT NULL,
    [IdDok]                      NUMERIC (19)    NOT NULL,
    [DataDecyzji]                DATETIME2 (3)   NULL,
    [NumerDecyzji]               NVARCHAR (40)   NULL,
    [TrescUzasadnienia]          NVARCHAR (1000) NOT NULL,
    [MRN]                        NVARCHAR (18)   NULL,
    [NumerPozycji]               NUMERIC (5)     NULL,
    [NumeryPozycjiTowarowych]    NVARCHAR (300)  NOT NULL,
    [TypDecyzjiAdministracyjnej] NVARCHAR (4)    NULL,
    [IdOperacjiNaZCP]            NUMERIC (19)    NULL,
    CONSTRAINT [ZCP_DecyzjaAdministracyjna_PK] PRIMARY KEY CLUSTERED ([IdDecyzji] ASC)
);

