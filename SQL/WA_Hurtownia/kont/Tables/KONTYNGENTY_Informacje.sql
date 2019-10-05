CREATE TABLE [kont].[KONTYNGENTY_Informacje] (
    [NrPorzadkowy]         VARCHAR (6)     NOT NULL,
    [KrajPochodzenia]      CHAR (2)        NULL,
    [DataOtwarcia]         DATETIME        NULL,
    [DataKoncowa]          DATETIME        NULL,
    [Status]               CHAR (1)        NULL,
    [DataZablokowania]     DATETIME        NULL,
    [DataWyczerpania]      DATETIME        NULL,
    [WielkoscPoczatkowa]   DECIMAL (21, 5) NULL,
    [AktualneSaldo]        DECIMAL (21, 5) NULL,
    [ProcentWykorzystania] DECIMAL (5, 2)  NULL,
    [DataOtw]              VARCHAR (255)   NULL
) ON [FG_KONT];

