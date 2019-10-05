CREATE TABLE [wald].[widelki_IMPORT_2010] (
    [kod_towarowy]  VARCHAR (8)     NULL,
    [znak]          VARCHAR (20)    NULL,
    [kraj_poch]     VARCHAR (2)     NULL,
    [min]           DECIMAL (20, 2) NULL,
    [max]           DECIMAL (20, 2) NULL,
    [srednia]       DECIMAL (20, 2) NULL,
    [rowki_wejscie] NUMERIC (18)    NULL,
    [rowki_odrzut]  NUMERIC (18)    NULL,
    [pk]            BIGINT          IDENTITY (1, 1) NOT NULL
) ON [WaldDane];

