CREATE TABLE [aimp2].[PWD_DaneARR] (
    [IdWpisu]                         NUMERIC (19)    NOT NULL,
    [IdTowarPWD]                      NUMERIC (19)    NULL,
    [IloscDodatkowa]                  NUMERIC (16, 6) NULL,
    [PozwolenieWazneDo]               DATETIME2 (3)   NULL,
    [StatusSalda]                     NVARCHAR (50)   NOT NULL,
    [DataWeryfikacji]                 DATETIME2 (3)   NULL,
    [OpisRozbieznosci]                NVARCHAR (1024) NULL,
    [NrPozwolenia]                    NVARCHAR (50)   NULL,
    [Ilosc]                           NUMERIC (16, 6) NULL,
    [DodatkJednMiary]                 NVARCHAR (3)    NULL,
    [KwalifikatorDodatkUzupJednMiary] NVARCHAR (1)    NULL,
    [JednostkaMiary]                  NVARCHAR (3)    NULL,
    [KwalifikatorJednostkiMiary]      NVARCHAR (1)    NULL,
    [IdWywolania]                     NVARCHAR (35)   NULL,
    CONSTRAINT [PWD_DaneARR_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC)
);

