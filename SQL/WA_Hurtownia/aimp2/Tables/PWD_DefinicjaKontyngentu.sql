CREATE TABLE [aimp2].[PWD_DefinicjaKontyngentu] (
    [IdDefinicji]                  NUMERIC (19)    NOT NULL,
    [BalansKontyngentu]            NVARCHAR (9)    NULL,
    [ZablokowanyOd]                DATETIME2 (3)   NULL,
    [ZablokowanyDo]                DATETIME2 (3)   NULL,
    [ProgStanuKrytycznego]         NVARCHAR (9)    NULL,
    [KodWaluty]                    NVARCHAR (3)    NULL,
    [KodWalutyPid]                 INT             NULL,
    [DataAktualizacji]             DATETIME2 (3)   NULL,
    [WartoscPoczatkowaKontyngentu] NUMERIC (15, 3) NULL,
    [ZablokowanyZawieszony]        BIT             NOT NULL,
    [StanKrytyczny]                BIT             NOT NULL,
    [Wyczerpany]                   BIT             NOT NULL,
    [NrPozycjiTowarowej]           NVARCHAR (6)    NULL,
    [KwalifikatorJednostkiMiary]   NVARCHAR (1)    NULL,
    [JednostkaMiary]               NVARCHAR (3)    NULL,
    [KontyngentWaznyOd]            DATETIME2 (3)   NULL,
    [KontyngentWaznyDo]            DATETIME2 (3)   NULL,
    CONSTRAINT [PWD_DefinicjaKontyngentu_PK] PRIMARY KEY CLUSTERED ([IdDefinicji] ASC) ON [FG_AIMP2]
);

