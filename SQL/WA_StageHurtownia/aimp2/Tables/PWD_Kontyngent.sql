CREATE TABLE [aimp2].[PWD_Kontyngent] (
    [IdKontyngentu]                       NUMERIC (19)    NOT NULL,
    [IdTowarPWD]                          NUMERIC (19)    NULL,
    [JednostkaMiaryWnioskowanejIlosci]    NVARCHAR (3)    NULL,
    [JednostkaMiaryWnioskowanejIlosciPid] INT             NULL,
    [WnioskowanaIloscWRamachKontyngentu]  NUMERIC (15, 3) NULL,
    [NumerPozycji]                        NUMERIC (1)     NULL,
    [KwalifikatorJednostkiMiary]          NVARCHAR (1)    NULL,
    [KwalifikatorJednostkiMiaryPid]       INT             NULL,
    [OpisKontyngentu]                     NVARCHAR (45)   NULL,
    [NumerKontyngentu]                    NVARCHAR (17)   NULL,
    [WniosekRetrospektywny]               BIT             NOT NULL,
    [WyslanoDoTQS]                        BIT             NOT NULL,
    [Status]                              NVARCHAR (4)    NULL,
    [StanWeryfikacji]                     NVARCHAR (1)    NULL,
    [StanWeryfikacji2]                    NVARCHAR (1)    NULL,
    [DanePokontrolne]                     NTEXT           NULL,
    [IdDefinicjiKontyngentu]              NUMERIC (19)    NULL,
    CONSTRAINT [PWD_Kontyngent_PK] PRIMARY KEY CLUSTERED ([IdKontyngentu] ASC)
);

